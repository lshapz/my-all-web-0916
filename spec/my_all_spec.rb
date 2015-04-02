describe Enumerable do
  describe "#my_all?" do

    # booleans
    let(:all_true) { [true, true, true] }
    let(:one_false) { [true, false, true] }
    let(:one_nil) { [true, nil, true] }
    let(:all_false) { [false, false, false] }

    # strings
    let(:animals) { ["ant",  "bear", "cat"] }
    let(:birds)   { ["dwarf jay", "Dodo", "dove", "Duck"] }
    
    # numbers
    let(:numbers) { [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ] }

    # hashes
    let(:foods) { {"a"=>"apple", "b"=>"banana", "c"=> "carrot", "e" => "egg"} }

    it "doesn't change the object it is called on" do
      animals.my_all?
      expect(animals).to eq(animals)
    end

    it "doesn't use clone" do
      my_animals = animals
      expect(my_animals).to_not receive(:clone)
      my_animals.my_all?
    end

    it "doesn't use #all?" do 
      my_animals = animals    
      expect(my_animals).to_not receive(:all?)
      my_animals.my_all?
    end

    context "without block" do
      it "returns true for arrays that contain no nils or falses" do
        [all_true, animals, birds, numbers].each do |array|
          expect(array.my_all?).to eq(true)
        end
      end
      it "returns false for arrays that contain at least one nil or false" do
        [one_nil, one_false, all_false].each do |array|
          expect(array.my_all?).to eq(false)
        end
      end
      it "returns true for food hash" do
        expect(foods.my_all?).to eq(true)
      end
    end

    context "with block" do
      it "returns true for arrays where every element returns true for the block" do
        expect(animals.my_all? { |animal| animal.length >= 3 } ).to eq(true)
        expect(birds.my_all? { |bird| bird[0].downcase == "d"} ).to eq(true)
        expect(numbers.my_all? { |num| num.class == Fixnum } ).to eq(true)
      end
      it "returns false for arrays where one or more elements returns false for the block" do
        expect(animals.my_all? { |animal| animal.length >= 4 } ).to eq(false)
        expect(birds.my_all? { |bird| bird[0] == "d"} ).to eq(false)
        expect(numbers.my_all? { |num| num >= 2 } ).to eq(false)
      end
      it "returns true when comparing first letters of key,values in food hash" do
        expect(foods.my_all? {|letter, food| food.length >= 3 } ).to eq(true)
      end
      it "returns false when comparing first letters of key,values in food hash" do
        expect(foods.my_all? {|letter, food| food.length > 3 } ).to eq(false)
      end
    end
  end
end
