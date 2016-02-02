module AlbumsHelper
  def album_thumbnail(album)
    if album.pictures.count > 0
      image_tag(album.pictures.first.asset.url(:small))
    else
      image_tag("https://pp.vk.me/c630526/v630526198/fe29/ht96GgvZVac.jpg")
    end
  end
end
