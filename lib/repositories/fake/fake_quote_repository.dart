import 'dart:math';

import 'package:quote_and_joke/models/quote_model.dart';
import 'package:quote_and_joke/repositories/abstract/quotes_repository.dart';
import 'package:quote_and_joke/utils/exceptions/network_exception.dart';

final _sampleQOD = Quote(
    quote:
        'Things work out best for those who make the best of how things work out.',
    author: 'John Wooden',
    authorShort: 'Wooden');

class FakeQuoteRepository implements QuoteRepository {
  FakeQuoteRepository()
      : quotes = [..._sampleQuotes],
        cachedQod = _sampleQOD;

  final random = Random();
  final List<Quote> quotes;
  final Quote cachedQod;

  @override
  Future<List<Quote>> fetchQuotes() async {
    await _waitRandomTime();

    if (random.nextDouble() < ERROR_CHANCE) {
      throw const NetworkException(
          "Error fetching quotes.\nCheck your internet connection.");
    } else {
      return quotes;
    }
  }

  @override
  Future<Quote> fetchQOD() async {
    await _waitRandomTime();

    if (random.nextDouble() < ERROR_CHANCE) {
      throw const NetworkException("Error fetching QOD");
    } else {
      return cachedQod;
    }
  }

  /// Simulates API call
  Future<void> _waitRandomTime() async {
    await Future.delayed(
      Duration(seconds: random.nextInt(3)),
      () {},
    ); // simulate loading
  }
}

final _sampleQuotes = [
  Quote(
      quote: 'What is not started today is never finished tomorrow.',
      author: 'Johann Wolfgang von Goethe',
      authorShort: 'Goethe'),
  Quote(
      quote: 'Nature and books belong to the eyes that see them.',
      author: 'Ralph Waldo Emerson',
      authorShort: 'Emerson'),
  Quote(
      quote: 'Do not wait for leaders; do it alone, person to person.',
      author: 'Mother Teresa',
      authorShort: 'Teresa'),
  Quote(
      quote:
          'Practice yourself, for heavens sake in little things, and then proceed to greater.',
      author: 'Epictetus',
      authorShort: 'Epictetus'),
  Quote(
      quote: 'Watch the little things; a small leak will sink a great ship.',
      author: 'Benjamin Franklin',
      authorShort: 'Franklin'),
  Quote(
      quote:
          'Genius unrefined resembles a flash of lightning, but wisdom is like the sun.',
      author: 'Franz Grillparzer',
      authorShort: 'Grillparzer'),
  Quote(
      quote: 'Go put your creed into the deed. Nor speak with double tongue.',
      author: 'Ralph Waldo Emerson',
      authorShort: 'Emerson'),
  Quote(
      quote: 'What is not started today is never finished tomorrow.',
      author: 'Johann Wolfgang von Goethe',
      authorShort: 'Goethe'),
  Quote(
      quote: 'Nature and books belong to the eyes that see them.',
      author: 'Ralph Waldo Emerson',
      authorShort: 'Emerson'),
  Quote(
      quote: 'Do not wait for leaders; do it alone, person to person.',
      author: 'Mother Teresa',
      authorShort: 'Teresa'),
  Quote(
      quote:
          'Practice yourself, for heavens sake in little things, and then proceed to greater.',
      author: 'Epictetus',
      authorShort: 'Epictetus'),
  Quote(
      quote: 'Watch the little things; a small leak will sink a great ship.',
      author: 'Benjamin Franklin',
      authorShort: 'Franklin'),
  Quote(
      quote:
          'Genius unrefined resembles a flash of lightning, but wisdom is like the sun.',
      author: 'Franz Grillparzer',
      authorShort: 'Grillparzer'),
  Quote(
      quote: 'Go put your creed into the deed. Nor speak with double tongue.',
      author: 'Ralph Waldo Emerson',
      authorShort: 'Emerson'),
  Quote(
      quote: 'What is not started today is never finished tomorrow.',
      author: 'Johann Wolfgang von Goethe',
      authorShort: 'Goethe'),
  Quote(
      quote: 'Nature and books belong to the eyes that see them.',
      author: 'Ralph Waldo Emerson',
      authorShort: 'Emerson'),
  Quote(
      quote: 'Do not wait for leaders; do it alone, person to person.',
      author: 'Mother Teresa',
      authorShort: 'Teresa'),
  Quote(
      quote:
          'Practice yourself, for heavens sake in little things, and then proceed to greater.',
      author: 'Epictetus',
      authorShort: 'Epictetus'),
  Quote(
      quote: 'Watch the little things; a small leak will sink a great ship.',
      author: 'Benjamin Franklin',
      authorShort: 'Franklin'),
  Quote(
      quote:
          'Genius unrefined resembles a flash of lightning, but wisdom is like the sun.',
      author: 'Franz Grillparzer',
      authorShort: 'Grillparzer'),
  Quote(
      quote: 'Go put your creed into the deed. Nor speak with double tongue.',
      author: 'Ralph Waldo Emerson',
      authorShort: 'Emerson'),
  Quote(
      quote: 'What is not started today is never finished tomorrow.',
      author: 'Johann Wolfgang von Goethe',
      authorShort: 'Goethe'),
  Quote(
      quote: 'Nature and books belong to the eyes that see them.',
      author: 'Ralph Waldo Emerson',
      authorShort: 'Emerson'),
  Quote(
      quote: 'Do not wait for leaders; do it alone, person to person.',
      author: 'Mother Teresa',
      authorShort: 'Teresa'),
  Quote(
      quote:
          'Practice yourself, for heavens sake in little things, and then proceed to greater.',
      author: 'Epictetus',
      authorShort: 'Epictetus'),
  Quote(
      quote: 'Watch the little things; a small leak will sink a great ship.',
      author: 'Benjamin Franklin',
      authorShort: 'Franklin'),
  Quote(
      quote:
          'Genius unrefined resembles a flash of lightning, but wisdom is like the sun.',
      author: 'Franz Grillparzer',
      authorShort: 'Grillparzer'),
  Quote(
      quote: 'Go put your creed into the deed. Nor speak with double tongue.',
      author: 'Ralph Waldo Emerson',
      authorShort: 'Emerson'),
  Quote(
      quote: 'What is not started today is never finished tomorrow.',
      author: 'Johann Wolfgang von Goethe',
      authorShort: 'Goethe'),
  Quote(
      quote: 'Nature and books belong to the eyes that see them.',
      author: 'Ralph Waldo Emerson',
      authorShort: 'Emerson'),
  Quote(
      quote: 'Do not wait for leaders; do it alone, person to person.',
      author: 'Mother Teresa',
      authorShort: 'Teresa'),
  Quote(
      quote:
          'Practice yourself, for heavens sake in little things, and then proceed to greater.',
      author: 'Epictetus',
      authorShort: 'Epictetus'),
  Quote(
      quote: 'Watch the little things; a small leak will sink a great ship.',
      author: 'Benjamin Franklin',
      authorShort: 'Franklin'),
  Quote(
      quote:
          'Genius unrefined resembles a flash of lightning, but wisdom is like the sun.',
      author: 'Franz Grillparzer',
      authorShort: 'Grillparzer'),
  Quote(
      quote: 'Go put your creed into the deed. Nor speak with double tongue.',
      author: 'Ralph Waldo Emerson',
      authorShort: 'Emerson'),
  Quote(
      quote: 'What is not started today is never finished tomorrow.',
      author: 'Johann Wolfgang von Goethe',
      authorShort: 'Goethe'),
  Quote(
      quote: 'Nature and books belong to the eyes that see them.',
      author: 'Ralph Waldo Emerson',
      authorShort: 'Emerson'),
  Quote(
      quote: 'Do not wait for leaders; do it alone, person to person.',
      author: 'Mother Teresa',
      authorShort: 'Teresa'),
  Quote(
      quote:
          'Practice yourself, for heavens sake in little things, and then proceed to greater.',
      author: 'Epictetus',
      authorShort: 'Epictetus'),
  Quote(
      quote: 'Watch the little things; a small leak will sink a great ship.',
      author: 'Benjamin Franklin',
      authorShort: 'Franklin'),
  Quote(
      quote:
          'Genius unrefined resembles a flash of lightning, but wisdom is like the sun.',
      author: 'Franz Grillparzer',
      authorShort: 'Grillparzer'),
  Quote(
      quote: 'Go put your creed into the deed. Nor speak with double tongue.',
      author: 'Ralph Waldo Emerson',
      authorShort: 'Emerson'),
  Quote(
      quote:
          'Practice yourself, for heavens sake in little things, and then proceed to greater.',
      author: 'Epictetus',
      authorShort: 'Epictetus'),
  Quote(
      quote: 'Watch the little things; a small leak will sink a great ship.',
      author: 'Benjamin Franklin',
      authorShort: 'Franklin'),
  Quote(
      quote:
          'Genius unrefined resembles a flash of lightning, but wisdom is like the sun.',
      author: 'Franz Grillparzer',
      authorShort: 'Grillparzer'),
  Quote(
      quote: 'Go put your creed into the deed. Nor speak with double tongue.',
      author: 'Ralph Waldo Emerson',
      authorShort: 'Emerson'),
  Quote(
      quote:
          'Practice yourself, for heavens sake in little things, and then proceed to greater.',
      author: 'Epictetus',
      authorShort: 'Epictetus'),
  Quote(
      quote: 'Watch the little things; a small leak will sink a great ship.',
      author: 'Benjamin Franklin',
      authorShort: 'Franklin'),
  Quote(
      quote:
          'Genius unrefined resembles a flash of lightning, but wisdom is like the sun.',
      author: 'Franz Grillparzer',
      authorShort: 'Grillparzer'),
  Quote(
      quote: 'Go put your creed into the deed. Nor speak with double tongue.',
      author: 'Ralph Waldo Emerson',
      authorShort: 'Emerson'),
];
