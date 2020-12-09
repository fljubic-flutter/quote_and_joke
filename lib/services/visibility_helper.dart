import 'package:hooks_riverpod/hooks_riverpod.dart';

final quoteIndexProvider = StateNotifierProvider((ref) => QuoteIndex());

//TODO: za svaku varijablu smisliti provider
//TODO: rastaviti u dvije klase - za quoteove i za today screen
class VisibilityService {
  bool _isLoading = false;

  bool _isDrag = false;
  bool _isQuoteOfDaySelected = true;

  bool _qodIsLiked = false;

  bool get qodIsLiked => _qodIsLiked;

  bool get isQuoteOfDaySelected => _isQuoteOfDaySelected;

  bool get isLoading => _isLoading;

  bool get isDrag => _isDrag;

  void changeQodLikedState() {
    _qodIsLiked = !_qodIsLiked;
  }

  void changeButtonSelected() {
    _isQuoteOfDaySelected = !_isQuoteOfDaySelected;
  }

  void changeLoadingState() {
    _isLoading = !_isLoading;
  }

  void setDrag(bool drag) {
    _isDrag = drag;
  }
}

class QuoteIndex extends StateNotifier<int> {
  QuoteIndex() : super(0);

  void resetIndex() {
    state = 0;
  }

  void increaseIndex() {
    state = state + 1;
  }
}