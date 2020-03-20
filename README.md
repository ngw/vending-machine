# Moloko Plus Vending Machine simulator

This tiny Vending Machine simulator lets you buy all special [Moloko Plus](https://en.wikipedia.org/wiki/Moloko_Plus)
beverages on the go.

It works by explointing the Pry binding utility[1] to do something completely unintended.

```bash
 ngw@abulafia  ~/Projects/vending-machine ● bin/vendingmachine
1: Moloko with Vellocet - £10.00
2: Moloko with Synthemesc - £12.25
3: Moloko with Drencrom - £15.85
4: Orange with knives - £5.00
5: Ultraviolence booster - £2.50

COMMANDS: restart CONFIGURATION_YAML_PATH
          buy ITEM_CODE, "MONEY"
          exit

From: /home/ngw/Projects/vending-machine/lib/vending_machine/cli.rb @ line 13 VendingMachine::CLI#call:

    11: def call
    12:   menu
 => 13:   binding.pry
    14: end

[1] pry(#<VendingMachine::CLI>)> buy code: 2, amount: '£25.67'
Moloko with Synthemesc bought
PLONK 6 £2.00 coins
PLONK 1 £1.00 coins
PLONK 2 £0.20 coins
PLONK 1 £0.02 coins
```

You can import a new configuration by copying the [configuration](config/moloko_plus.yml) and issuing the
`restart` command. That also resets the machine, in case you finished all the drinks (what's wrong with you?)

```ruby
[3] pry(#<VendingMachine::CLI>)> restart configuration_path: File.join(__dir__, 'config', 'moloko_plus.yml')
=> #<VendingMachine::Engine:0x000056519aa32ab8
 @change=
  #<VendingMachine::Change:0x000056519aae33e0
   @coins=
    {"£2"=>[#<Money fractional:200 currency:GBP>, 6],
     "£1"=>[#<Money fractional:100 currency:GBP>, 10],
     "0.50p"=>[#<Money fractional:50 currency:GBP>, 25],
     "0.20p"=>[#<Money fractional:20 currency:GBP>, 30],
     "0.10p"=>[#<Money fractional:10 currency:GBP>, 50],
     "0.05p"=>[#<Money fractional:5 currency:GBP>, 60],
     "0.02p"=>[#<Money fractional:2 currency:GBP>, 70],
     "0.01p"=>[#<Money fractional:1 currency:GBP>, 80]}>,
 @init_path="./config/moloko_plus.yml",
 @products=
  {1=>#<VendingMachine::Product:0x000056519aac6380 @name="Moloko with Vellocet", @price=#<Money fractional:1000 currency:GBP>, @quantity=2>,
   2=>#<VendingMachine::Product:0x000056519aac5fc0 @name="Moloko with Synthemesc", @price=#<Money fractional:1225 currency:GBP>, @quantity=4>,
   3=>#<VendingMachine::Product:0x000056519aac5890 @name="Moloko with Drencrom", @price=#<Money fractional:1585 currency:GBP>, @quantity=1>,
   4=>#<VendingMachine::Product:0x000056519aac4990 @name="Orange with knives", @price=#<Money fractional:500 currency:GBP>, @quantity=6>,
   5=>#<VendingMachine::Product:0x000056519aac43a0 @name="Ultraviolence booster", @price=#<Money fractional:250 currency:GBP>, @quantity=10>}>
```

[1] I wanted to be a good Malchick and use the TTY gem but not enought time, apply-polly loggies.
