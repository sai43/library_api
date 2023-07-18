require 'rails_helper'

RSpec.describe Book, type: :model do

  let(:library) { create(:library) }
  let(:author) { create(:author) }

  it "is valid with valid attributes" do
    @book = build(:book)
    @book.library = library
    @book.author = author
    expect(@book).to be_valid
  end

  it "is not valid without library_id" do
    @book2 = build(:book, title: "blah blah")
    @book2.author = author
    expect(@book2).to_not be_valid
  end

  it "is not valid without author_id" do
    @book3 = build(:book)
    @book3.library = library
    expect(@book3).to_not be_valid
  end

end
