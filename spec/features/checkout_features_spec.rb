require 'spec_helper'

describe "Adding an item to the cart" do 

  it "updates the cart without redirecting" do 
    item1 = Item.create(title: "Deviled Eggs", description: "twelve luscious eggs", price: 1)
    item2 = Item.create(title: "Waffles", description: "syrup", price: 3)
    item3 = Item.create(title: "quinoa", description: "grainy", price: 9)

    visit "/"
    click_on "Platable"
    current_url.should == "/platable/items" 

    expect(page).to have_text("Deviled Eggs")
    within("#item_2") do 
      click_on "Add to Order"
    end
    within("#item_2") do 
      click_on "Add to Order"
    end
    expect(page).to have_text("My Order (2)")
    current_url.should == "/platable/items" 
     
  end
end