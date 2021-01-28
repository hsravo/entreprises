require 'rails_helper'

RSpec.describe Charity, type: :model do

  before(:each) do 
    @charity = Charity.create(
      id_association: "691P0990I00024", 
      name: "MEDECINS DU MONDE", 
      code_gestion: "691P", 
      adresse_code_postal: "75018", 
      adresse_libelle_commune: "PARIS", 
      date_creation: "1999-10-07", 
      email: "1234@test.com")
  end

  context "validation" do
  
    describe "#id_association" do
      it "should not be valid without RNA" do
        bad_charity = Charity.create(
          name: "MEDECINS DU MONDE", 
          code_gestion: "691P", 
          adresse_code_postal: "75018", 
          adresse_libelle_commune: "PARIS", 
          date_creation: "1999-10-07", 
          email: "1234@test.com")
        expect(bad_charity).not_to be_valid
        expect(bad_charity.errors.include?(:id_association)).to eq(true)
      end
    end

    describe "#name" do
      it "should not be valid without name" do
          bad_charity = Charity.create(
          id_association: "691P0990I00024", 
          code_gestion: "691P", 
          adresse_code_postal: "75018", adresse_libelle_commune: "PARIS", 
          date_creation: "1999-10-07", 
          email: "1234@test.com")
          expect(bad_charity).not_to be_valid 
          expect(bad_charity.errors.include?(:name)).to eq(true)
      end
    end

    describe "#code_gestion" do
      it "should not be valid without code gestion" do
          bad_charity = Charity.create(
            id_association: "691P0990I00024", 
            name: "MEDECINS DU MONDE", 
            adresse_code_postal: "75018",
            adresse_libelle_commune: "PARIS",
            date_creation: "1999-10-07",
            email: "1234@test.com"
            )
          expect(bad_charity).not_to be_valid
          expect(bad_charity.errors.include?(:code_gestion)).to eq(true)
      end
    end

    describe "#adresse_code_postal" do
      it "should not be valid without code postal" do
          bad_charity = Charity.create(
            id_association: "691P0990I00024", 
            name: "MEDECINS DU MONDE",
            code_gestion: "691P",
            adresse_libelle_commune: "PARIS",
            date_creation: "1999-10-07",
            email: "1234@test.com"
            )
          expect(bad_charity).not_to be_valid
          expect(bad_charity.errors.include?(:adresse_code_postal)).to eq(true)
      end
    end

    describe "#adresse_libelle_commune" do
      it "should not be valid without commune" do
          bad_charity = Charity.create(
            id_association: "691P0990I00024", 
            name: "MEDECINS DU MONDE", 
            code_gestion: "691P",
            adresse_code_postal: "75018",
            date_creation: "1999-10-07",
            email: "1234@test.com"
            )
          expect(bad_charity).not_to be_valid
          expect(bad_charity.errors.include?(:adresse_libelle_commune)).to eq(true)
      end
    end

    describe "#date_creation" do
      it "should not be valid without date de création" do
          bad_charity = Charity.create(
            id_association: "691P0990I00024", 
            name: "MEDECINS DU MONDE", 
            code_gestion: "691P",
            adresse_code_postal: "75018",
            adresse_libelle_commune: "PARIS",
            email: "1234@test.com"
            )
          expect(bad_charity).not_to be_valid
          expect(bad_charity.errors.include?(:date_creation)).to eq(true)
      end
    end

    describe "#email" do
      it "should not be valid without date de création" do
          bad_charity = Charity.create(
            id_association: "691P0990I00024", 
            name: "MEDECINS DU MONDE", 
            code_gestion: "691P",
            adresse_code_postal: "75018",
            adresse_libelle_commune: "PARIS",
            date_creation: "1999-10-07",
            )
          expect(bad_charity).not_to be_valid
          expect(bad_charity.errors.include?(:email)).to eq(true)
      end
    end

  end

  context "public instance methods" do

    describe "#id_association" do

      it "should return a string" do
        expect(@charity.id_association).to be_a(String)
      end

    end

    describe "#name" do

      it "should return a string" do
        expect(@charity.name).to be_a(String)
      end

    end

    describe "#code_gestion" do

      it "should return a string" do
        expect(@charity.code_gestion).to be_a(String)
      end

    end

    describe "#adresse_code_postal" do

      it "should return a string" do
        expect(@charity.adresse_code_postal).to be_a(String)
      end

    end

    describe "#adresse_libelle_commune" do

      it "should return a string" do
        expect(@charity.adresse_libelle_commune).to be_a(String)
      end

    end

    describe "#date_creation" do

      it "should return a date" do
        expect(@charity.date_creation).to be_a(Date)
      end

    end

    describe "#email" do

      it "should return a string" do
        expect(@charity.email).to be_a(String)
      end

    end

  end

end