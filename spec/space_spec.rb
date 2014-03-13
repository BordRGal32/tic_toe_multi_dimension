# require 'rspec'
# require 'space'

# describe Space do
#   before do
#     Space.clear
#   end
#   describe '#initialize' do
#     it 'initialzes the new instance of space' do
#       new_space = Space.new({:value => 1, :player => 'player'})
#       new_space.should be_an_instance_of Space
#     end
#   end
#   describe '.create' do
#     it 'initializes a space' do
#       new_space = Space.create({:value => 1, :player => 'player'})
#       new_space.should be_an_instance_of Space
#     end
#   end
#   describe '.all' do
#     it 'shows the Space.all array' do
#       new_space = Space.create({:value => 1, :player => 'player'})
#       Space.all.should eq [new_space]
#     end
#   end
#   describe '#save' do
#     it 'pushes the created space into the all space array' do
#      new_space = Space.create({:value => 1, :player => 'player'})
#      Space.all.length.should eq 1
#    end
#   end
#   describe '.clear' do
#     it 'clears the Space.all array'do
#       new_space = Space.create({:value => 1, :player => 'player'})
#       Space.clear
#       Space.all.length.should eq 0
#     end
#   end
#   describe '#player' do
#     it 'returns what player owns a space' do
#       new_space = Space.create({:value => 1, :player => 'pauline'})
#       new_space.player.should eq 'pauline'
#     end
#   end
# end
