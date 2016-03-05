class Poker < ActiveRecord::Base
  def poker_hand(cards)
    cards = cards.split(" ")
    suits = cards.collect do |c| c[0,1] end
    ranks = cards.each do |c| c.slice!(0,1) end.sort
    numbers = ranks.collect do |rank| rank.to_i end.sort

    flush = suits.uniq.size == 1
    straight = numbers == (numbers[0]..numbers[0]+4).to_a

    return "ストレートフラッシュ"  if flush && straight
    return "フラッシュ"           if flush
    return "ストレート"        if straight

    groups = ranks.uniq.collect do |item|
      ranks.select do |rank| rank == item end.size
    end.sort.reverse

    return "フォー・オブ・ア・カインド"  if groups == [4, 1]
    return "フルハウス"      if groups == [3, 2]
    return "スリー・オブ・ア・カインド" if groups == [3, 1, 1]
    return "ツーペア"        if groups == [2, 2, 1]
    return "ワンペア"        if groups == [2, 1, 1, 1]
    return "ハイカード"
  end
end
