require 'international_date_parser'
RSpec.describe InternationalDateParser do
  context 'class methods' do
    describe 'international_date_parser' do
      let :idp do
        InternationalDateParser::Date
      end
      it 'is nil when input date is nil or empty' do
        expect(idp.parse_international(nil)).to be nil
        expect(idp.parse_international([])).to be nil
      end
      describe 'given a date without words' do
        it 'returns a date if Ymd is given' do
          expect(idp.parse_international('2011-01-01')).to eq Date.new(2011,01,01)
        end
        it 'returns a date if dmY is given' do
          expect(idp.parse_international('01-01-2011')).to eq Date.new(2011,01,01)
        end
        it 'returns a date if ymd is given' do
          expect(idp.parse_international('11-01-01')).to eq Date.new(2011,01,01)
        end
      end
      describe 'given a date in english' do
        it 'returns a date' do
          expect(idp.parse_international('2011 January 01')).to eq Date.new(2011,01,01)
          expect(idp.parse_international('2011 Jan 01')).to eq Date.new(2011,01,01)
          expect(idp.parse_international('01 January 2011')).to eq Date.new(2011,01,01)
          expect(idp.parse_international('01 Jan 2011')).to eq Date.new(2011,01,01)
        end 
      end
      describe 'given a date in portuguese' do
        it 'returns a date' do
          expect(idp.parse_international('2011 Fevereiro 01')).to eq Date.new(2011,02,01)
          expect(idp.parse_international('2011 Fev 01')).to eq Date.new(2011,02,01)
          expect(idp.parse_international('01 Fevereiro 2011')).to eq Date.new(2011,02,01)
          expect(idp.parse_international('01 Fev 2011')).to eq Date.new(2011,02,01)
        end 
      end
      describe 'given a date without the year' do
        it 'returns a date' do
          expect(idp.parse_international('Fevereiro 01')).to eq Date.new(2018,02,01)
          expect(idp.parse_international('Fev 01')).to eq Date.new(2018,02,01)
          expect(idp.parse_international('01 Fevereiro')).to eq Date.new(2018,02,01)
          expect(idp.parse_international('01 Fev')).to eq Date.new(2018,02,01)
        end 
      end
      describe 'given a date in array' do
        it 'returns a date' do
          expect(idp.parse_international(['Fevereiro 01'])).to eq Date.new(2018,02,01)
          expect(idp.parse_international([[01],['Fev']])).to eq Date.new(2018,02,01)
          expect(idp.parse_international([['Fev'],['01']])).to eq Date.new(2018,02,01)
          expect(idp.parse_international([['Fev'],['01'],[2011]])).to eq Date.new(2011,02,01)
        end 
      end
    end
  end
end