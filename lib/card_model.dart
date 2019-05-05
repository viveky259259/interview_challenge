class CardModel{
  int _sum,_balanceSum,_type;
  String _name,_cardNumber,_title;
  DateTime _endDate;

  CardModel(this._name,this._title,this._sum,this._balanceSum,this._cardNumber,this._endDate,this._type);

  DateTime get endDate => _endDate;

  get title => _title;

  get cardNumber => _cardNumber;

  String get name => _name;

  get balanceSum => _balanceSum;

  int get sum => _sum;

  get type => _type;


}