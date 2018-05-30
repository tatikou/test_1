$map = ["###########",
        "#o  A#B  G#",
        "# ##   ## #",
        "# # o#o   #",
        "# # ### # #",
        "#S   o   o#",
        "###########"]
$time = 50

#class enemy
#end

class Hero
  def initialize
    @items = 0
    @i_
    @j_
  end
  def set(i,j)
    @i = i
    @j = j
  end
  def item_set
    @items += 1
  end
  def goal_set(i,j)
    @gi = i
    @gj = j
  end
  def check_move(course)
    case course
    when "u" then
      if $map[@i-1][@j] == "#"|| $map[@i-1][@j] >= "A" && $map[@i-1][@j] <= "E"
        return false
      else
        return @i,@j,@i-1,@j;
      end
    when "d" then
      if $map[@i+1][@j] == "#"|| $map[@i+1][@j] >= "A" && $map[@i+1][@j] <= "E"
        return false
      else
        return @i,@j,@i+1,@j;
      end
    when "l" then
      if $map[@i][@j-1] == "#"|| $map[@i][@j-1] >= "A" && $map[@i][@j-1] <= "E"
        return false
      else
        return @i,@j,@i,@j-1;
      end
    when "r" then
      if $map[@i][@j+1] == "#"|| $map[@i][@j+1] >= "A" && $map[@i][@j+1] <= "E"
        return false
      else
        return @i,@j,@i,@j+1;
      end
    when "w" then
      return @i,@j,@i,@j;
    else
      return false
    end
  end
  def check_item(i,j)
    if $map[i][j] == "o"
      @items -= 1
    end
  end
  def check_goal
    if @gi == @i && @gj == @j && @items ==  0
      return "clear"
    else
      return "game"
    end
  end
  def goal_dis
    if $map[@gi][@gj] == " "
      $map[@gi][@gj] == "G"
    end
  end
  def move_ij(i,j)
    @i = i
    @j = j
  end
end
$hero = Hero.new

for i in 0..$map.length-1
  for j in 0..$map[i].length-1
    case $map[i][j]
    when "A" then

    when "B" then

    when "C" then

    when "D" then

    when "E" then

    when "S" then
      $hero.set(i,j)
    when "o" then
      $hero.item_set
    when "G" then
      $hero.goal_set(i,j)
    end
  end
end

$state = "gema"
puts "time#{$time}"
for i in 0..$map.length-1
  for j in 0..$map[i].length-1
    print $map[i][j]
  end
  puts
end
#puts $hero.instance_exec { @items }
while $time >= 1

   course = gets.chomp
  if $hero.check_move(course) != false
    last_i,last_j,i,j　= $hero.check_move(course)
    puts last_i,last_j,i,j
    $hero.check_item(i,j)
    $map[last_i][last_j] = " "
    $map[i][j] = "S"
    $hero.move_ij(i,j)
    $hero.goal_dis
    $state = $hero.check_goal
    $time -= 1
  end
  puts "time#{$time}"
  for i in 0..$map.length-1
    for j in 0..$map[i].length-1
      print $map[i][j]
    end
    puts
  end
  if $time == 0
    $state = "timeup"
  end
end
