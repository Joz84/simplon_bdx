class AnimalPictureService
  def initialize(attrs)
    @api_key = ENV['PIXABAY_API_KEY']
    @animal = attrs[:animal]
  end

  def call
    url = "https://pixabay.com/api/?key=#{@api_key}&q=#{@animal.parameterize}&lang=fr&image_type=photo&category=animals"
    reponse = RestClient.get url
    pictures = JSON.parse(reponse)["hits"]
    pictures.first["largeImageURL"]
  rescue
    "https://simplon.co/wp-content/uploads/2019/01/Sans-nom-2.png"
  end
end
