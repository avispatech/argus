require 'spec_helper'
Inflector = ActiveSupport::Inflector
require_relative '../inflections'
RSpec.describe Inflector do
  singular_to_plural = {
    'Sustantivos y adjetivos terminados en -ch forman el plural añadiendo -es' => [
      %w[sandwich sandwiches],
      %w[maquech maqueches]
    ],

    'Sustantivos y adjetivos terminados en consonantes distintas de -l, -r, -n, -d, -z, -j, -s, -x, -ch forman el plural añadiendo -s' => [
      %w[crac cracs],
      %w[crack cracks],
      %w[mamut mamuts],
      %w[cómic cómics],
      %w[chip chips]
    ],

    'Sustantivos y adjetivos terminados en -l, -r, -n, -d, -z, -j. Si no van precedidas de otra consonante forman el plural añadiendo -es' => [
      %w[dócil dóciles],
      %w[color colores],
      %w[pan panes],
      %w[césped céspedes],
      %w[cáliz cálices],
      %w[reloj relojes],
      %w[píxel píxeles],
      %w[interfaz interfaces]
    ],

    'Sustantivos y adjetivos terminados en -i o en -u tónicas forman el plural añadiendo -es' => [
      %w[bisturí bisturíes],
      %w[tabú tabúes],
      %w[hindú hindúes],
      %w[israelí israelíes]
    ],

    'Sustantivos y adjetivos terminados en vocal átona o en -e tónica forman el plural añadiendo -s' => [
      %w[papá papás],
      %w[sofá sofás],
      %w[buró burós],
      %w[rococó rococós],
      %w[dominó dominós],
      %w[casa casas],
      %w[estudiante estudiantes],
      %w[taxi taxis],
      %w[comité comités],
      %w[bebé bebés]
    ],

    'Sustantivos y adjetivos terminados en grupo consonántico forman el plural añadiendo -s' => [
      %w[gong gongs],
      %w[iceberg icebergs],
      %w[récord récords]
    ],

    'Sustantivos y adjetivos terminados en -y precedida de vocal forman el plural añadiendo -es' => [
      %w[ley leyes],
      %w[rey reyes],
      %w[buey bueyes]
    ],

    'Sustantivos y adjetivos terminados en -s o en -x forman el plural añadiendo -es' => [
      %w[tos toses],
      %w[vals valses],
      %w[fax faxes],
      %w[compás compáses]
    ],

    'Voces extranjeras terminadas en -y precedida de consonante. Deben adaptarse gráficamente al español sustituyendo la -y por -i forman el plural añadiendo -s' => [
      %w[dandi dandis],
      %w[ferri ferris]
    ],

    'Cosas terminadas en ción deben pasar a ser ciones' => [
      %w[canción canciones],
      %w[invención invenciones],
      %w[colisión colisiones],
      %w[inversión inversiones] 
    ]
  }

  describe '#pluralize' do
    singular_to_plural.each do |rule, pairs|
      context rule do
        pairs.each do |singular, plural|
          puts "Testing #{singular} -> #{plural}"
          puts "#{plural.singularize(:es)} => #{singular.pluralize(:es)}"
          it { expect(plural.singularize(:es)).to eq(singular) }
          it { expect(singular.pluralize(:es)).to eq(plural) }
        end
      end
    end
  end
end
