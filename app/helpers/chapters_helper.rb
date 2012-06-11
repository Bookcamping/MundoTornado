# encoding: utf-8
module ChaptersHelper

  def chapter_name(chapter)
    "Capítulo #{chapter.position}: #{chapter.title}"
  end
end
