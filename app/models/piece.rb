class Piece < ActiveRecord::Base
  belongs_to :artist
  has_and_belongs_to_many :exhibitions, join_table: :displays
  
  before_save :attach_artist, unless: Proc.new{|a| a.artist_name.blank?}
  before_save :strip_description
  after_create :attach_image, if: -> { upload_url.present? }
  
  scope :featured, -> { where(featured: true) }
  
  attr_accessor :artist_name
  
  has_attached_file :image,
    whiny: false,
    styles: {
      thumb: 'x90',
      medium: 'x480',
      large: '960x720'
    }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
  def strip_description
    desc = self[:description]
    loop do
      ['<br>', '<br />', '<br >'].each do |pattern|
        t = Regexp.escape(pattern)
        desc.gsub!(/^(\s* #{pattern} \s*)+  /x, '')
        desc.gsub!(/ (\s* #{pattern} \s*)+ $/x, '')
      end
      break if desc == self[:description]
    end
  end
  
  def attach_artist
    self.artist = Artist.find_or_create_by(name: artist_name)
  end
  
  def attach_image
    move_upload_to_paperclip
  end
  
  def move_upload_to_paperclip
    self.image = URI.parse(self.upload_url)
    self.save
  end

  def upload_object
    s3 = AWS::S3.new
    bucket = s3.buckets['devvin']
    bucket.objects[upload_key]
  end
end