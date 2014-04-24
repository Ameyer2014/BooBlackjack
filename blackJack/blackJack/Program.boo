namespace blackJack

import System



class Card:
		[Property(Name)]
		_name as String
		[Property(Suit)]
		_suit as String
		[Property(InPlay)]
		_inPlay as int
		[Property(Value)]
		_value as int

r = System.Random()
_foo as (Card) = array(Card, 52)
_player as (Card) = array(Card, 52)
_comp as (Card) = array(Card, 52)
p = 0
c = 0
pScore = 0
cScore = 0
keep_Going = "Y"

def build():
		s as string
		for i in range(0,13):
			card = Card()
			if i == 0:
				_foo[i] = card
				_foo[i].Name = "Ace"
				_foo[i].Suit = "Spades"
				_foo[i].Value = 11
			elif i == 10:
				_foo[i] = card
				_foo[i].Name = "Jack"
				_foo[i].Suit = "Spades"
				_foo[i].Value = 10
			elif i == 11:
				_foo[i] = card
				_foo[i].Name = "Queen"
				_foo[i].Suit = "Spades"
				_foo[i].Value = 10
			elif i == 12:
				_foo[i] = card
				_foo[i].Name = "King"
				_foo[i].Suit = "Spades"
				_foo[i].Value = 10
			else:
				_foo[i] = card
				s = (i+1).ToString()
				_foo[i].Name = s
				_foo[i].Suit = "Spades"
				_foo[i].Value = i + 1
				
		for i in range(0,13):
			card = Card()
			if i == 0:
				_foo[i + 13] = card
				_foo[i + 13].Name = "Ace"
				_foo[i + 13].Suit = "Hearts"
				_foo[i + 13].Value = 11
			elif i == 10:
				_foo[i + 13] = card
				_foo[i + 13].Name = "Jack"
				_foo[i + 13].Suit = "Hearts"
				_foo[i + 13].Value = 10
			elif i == 11:
				_foo[i + 13] = card
				_foo[i + 13].Name = "Queen"
				_foo[i + 13].Suit = "Hearts"
				_foo[i + 13].Value = 10
			elif i == 12:
				_foo[i + 13] = card
				_foo[i + 13].Name = "King"
				_foo[i + 13].Suit = "Hearts"
				_foo[i + 13].Value = 10
			else:
				_foo[i + 13] = card
				s = (i+1).ToString()
				_foo[i + 13].Name = s
				_foo[i + 13].Suit = "Hearts"
				_foo[i + 13].Value = i + 1
				
		for i in range(0,13):
			card = Card()
			if i == 0:
				_foo[i + 26] = card
				_foo[i + 26].Name = "Ace"
				_foo[i + 26].Suit = "Clubs"
				_foo[i + 26].Value = 11
			elif i == 10:
				_foo[i + 26] = card
				_foo[i + 26].Name = "Jack"
				_foo[i + 26].Suit = "Clubs"
				_foo[i + 26].Value = 10
			elif i == 11:
				_foo[i + 26] = card
				_foo[i + 26].Name = "Queen"
				_foo[i + 26].Suit = "Clubs"
				_foo[i + 26].Value = 10
			elif i == 12:
				_foo[i + 26] = card
				_foo[i + 26].Name = "King"
				_foo[i + 26].Suit = "Clubs"
				_foo[i + 26].Value = 10
			else:
				_foo[i + 26] = card
				s = (i+1).ToString()
				_foo[i + 26].Name = s
				_foo[i + 26].Suit = "Clubs"
				_foo[i + 26].Value = i + 1
		
		for i in range(0,13):
			card = Card()
			if i == 0:
				_foo[i + 39] = card
				_foo[i + 39].Name = "Ace"
				_foo[i + 39].Suit = "Diamonds"
				_foo[i + 39].Value = 11
			elif i == 10:
				_foo[i + 39] = card
				_foo[i + 39].Name = "Jack"
				_foo[i + 39].Suit = "Diamonds"
				_foo[i + 39].Value = 10
			elif i == 11:
				_foo[i + 39] = card
				_foo[i + 39].Name = "Queen"
				_foo[i + 39].Suit = "Diamonds"
				_foo[i + 39].Value = 10
			elif i == 12:
				_foo[i + 39] = card
				_foo[i + 39].Name = "King"
				_foo[i + 39].Suit = "Diamonds"
				_foo[i + 39].Value = 10
			else:
				_foo[i + 39] = card
				s = (i+1).ToString()
				_foo[i + 39].Name = s
				_foo[i + 39].Suit = "Diamonds"
				_foo[i + 39].Value = i + 1
				
		for i in range(0,52):
			_foo[i].InPlay = 0


def deal(i as int):
	a = r.Next(0,1000)
	b = a % 52
	if _foo[b].InPlay == 0:
		if i % 2 == 0:
			_player[p] = _foo[b]
			_foo[b].InPlay = 1
			pScore += _player[p].Value
			p++
		else:
			_comp[c] = _foo[b]
			_foo[b].InPlay = 1
			cScore += _comp[c].Value
			c++
	else:
		deal(i)

def hit(who as string):
	if who == "player":
		a = r.Next(0,1000)
		b = a % 52
		if _foo[b].InPlay == 0:
			_player[p] = _foo[b]
			print "You drew ${_player[p].Name} of ${_player[p].Suit}"
			_foo[b].InPlay = 1
			pScore += _player[p].Value
			p++
			for i in range(0,p):
				if _player[i].Name == "Ace":
					if pScore > 21:
						_player[i].Value = 1
						pScore -= 10
			pScore = 0
			for i in range(0,p):
				pScore += _player[i].Value
			print "\n"
		else:
			hit(who)
	elif who == "comp":
		a = r.Next(0,1000)
		b = a % 52
		if _foo[b].InPlay == 0:
			_comp[c] = _foo[b]
			print "Dealer drew ${_comp[c].Name} of ${_comp[c].Suit}"
			_foo[b].InPlay = 1
			cScore += _comp[c].Value
			c++
			for i in range(0,c):
				if _comp[i].Name == "Ace":
					if cScore > 21:
						_comp[i].Value = 1
						cScore -= 10
			cScore = 0
			for i in range(0,c):
				cScore += _comp[i].Value
			print "\n"
		else:
			hit(who)
			
def comp_Calc() as int:
	while cScore < 16:
		hit("comp")
		if cScore > 21:
			print "Dealer Bust!"
			return 1

def play() as int:
	input = prompt("Hit or Stay?\n")
	while input != "Stay":
		if input == "stay":
			break
		if input == "Hit":
			hit("player")
			if pScore > 21:
				print "Bust!"
				return 0
			else:
				print "Your Hand:"
				for i in range(0,p):
					print "${_player[i].Name} of ${_player[i].Suit}"
				print "\n"
				input = prompt("Hit or Stay?\n")
		elif input == "hit":
			hit("player")
			if pScore > 21:
				print "Bust!"
				return 0
			else:
				print "Your Hand:"
				for i in range(0,p):
					print "${_player[i].Name} of ${_player[i].Suit}"
				print "\n"
				input = prompt("Hit or Stay?\n")
		else:
			print "Please give a valid input"
			input = prompt("Hit or Stay?\n")
	
	print "\n"
	
	print "Dealer Hand:"
	for i in range(0,c):
		print "${_comp[i].Name} of ${_comp[i].Suit}"
		
	if comp_Calc() == 1:
		return 0
	
	print "\n"
	
	print "You Have ${pScore}"
	if pScore == 21:
		print "Blackjack!"
	
	print "Dealer Has ${cScore}"
	if cScore == 21:
		print "Dealer Blackjack!"
		
	print "\n"
	
	if pScore > cScore:
		print "You Win!\n"
	elif pScore == cScore:
		print "Split the Pot!\n"
	else:
		print "Dealer Wins!\n"
		
	print "Your Hand:"
	for i in range(0,p):
		print "${_player[i].Name} of ${_player[i].Suit}"
		
	print "\n"
	
	print "Dealer Hand:"
	for i in range(0,c):
		print "${_comp[i].Name} of ${_comp[i].Suit}"
	
def main():	
	build()	
	
	//for i in range(0,52):
		//print "The card is ${_foo[i].Name} of ${_foo[i].Suit} as is ${_foo[i].InPlay} with value ${_foo[i].Value}"
	
	
	for i in range(0,4):
		deal(i)
		
	print "Your Hand:"
	for i in range(0,p):
		print "${_player[i].Name} of ${_player[i].Suit}"
	
	print "\n"
	
	play()
	
	keep_Going = prompt("Play Again? (Y/N)\n")


while keep_Going == "Y":
	for i in range(0,20):
		print "\n"
	main()
	for i in range(0,52):
		_foo[i].InPlay = 0
	pScore = 0
	cScore = 0
	p = 0
	c = 0


print "Press any key to continue . . . "
Console.ReadKey(true)
