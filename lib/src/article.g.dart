// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Article> _$articleSerializer = new _$ArticleSerializer();

class _$ArticleSerializer implements StructuredSerializer<Article> {
  @override
  final Iterable<Type> types = const [Article, _$Article];
  @override
  final String wireName = 'Article';

  @override
  Iterable<Object> serialize(Serializers serializers, Article object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'article_link',
      serializers.serialize(object.article_link,
          specifiedType: const FullType(String)),
      'article_title',
      serializers.serialize(object.article_title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'publish_date',
      serializers.serialize(object.publish_date,
          specifiedType: const FullType(String)),
      'source',
      serializers.serialize(object.source,
          specifiedType: const FullType(String)),
      'source_link',
      serializers.serialize(object.source_link,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Article deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArticleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'article_link':
          result.article_link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'article_title':
          result.article_title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'publish_date':
          result.publish_date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'source':
          result.source = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'source_link':
          result.source_link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Article extends Article {
  @override
  final String article_link;
  @override
  final String article_title;
  @override
  final String description;
  @override
  final String publish_date;
  @override
  final String source;
  @override
  final String source_link;

  factory _$Article([void Function(ArticleBuilder) updates]) =>
      (new ArticleBuilder()..update(updates)).build();

  _$Article._(
      {this.article_link,
      this.article_title,
      this.description,
      this.publish_date,
      this.source,
      this.source_link})
      : super._() {
    if (article_link == null) {
      throw new BuiltValueNullFieldError('Article', 'article_link');
    }
    if (article_title == null) {
      throw new BuiltValueNullFieldError('Article', 'article_title');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('Article', 'description');
    }
    if (publish_date == null) {
      throw new BuiltValueNullFieldError('Article', 'publish_date');
    }
    if (source == null) {
      throw new BuiltValueNullFieldError('Article', 'source');
    }
    if (source_link == null) {
      throw new BuiltValueNullFieldError('Article', 'source_link');
    }
  }

  @override
  Article rebuild(void Function(ArticleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArticleBuilder toBuilder() => new ArticleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Article &&
        article_link == other.article_link &&
        article_title == other.article_title &&
        description == other.description &&
        publish_date == other.publish_date &&
        source == other.source &&
        source_link == other.source_link;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, article_link.hashCode), article_title.hashCode),
                    description.hashCode),
                publish_date.hashCode),
            source.hashCode),
        source_link.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Article')
          ..add('article_link', article_link)
          ..add('article_title', article_title)
          ..add('description', description)
          ..add('publish_date', publish_date)
          ..add('source', source)
          ..add('source_link', source_link))
        .toString();
  }
}

class ArticleBuilder implements Builder<Article, ArticleBuilder> {
  _$Article _$v;

  String _article_link;
  String get article_link => _$this._article_link;
  set article_link(String article_link) => _$this._article_link = article_link;

  String _article_title;
  String get article_title => _$this._article_title;
  set article_title(String article_title) =>
      _$this._article_title = article_title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _publish_date;
  String get publish_date => _$this._publish_date;
  set publish_date(String publish_date) => _$this._publish_date = publish_date;

  String _source;
  String get source => _$this._source;
  set source(String source) => _$this._source = source;

  String _source_link;
  String get source_link => _$this._source_link;
  set source_link(String source_link) => _$this._source_link = source_link;

  ArticleBuilder();

  ArticleBuilder get _$this {
    if (_$v != null) {
      _article_link = _$v.article_link;
      _article_title = _$v.article_title;
      _description = _$v.description;
      _publish_date = _$v.publish_date;
      _source = _$v.source;
      _source_link = _$v.source_link;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Article other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Article;
  }

  @override
  void update(void Function(ArticleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Article build() {
    final _$result = _$v ??
        new _$Article._(
            article_link: article_link,
            article_title: article_title,
            description: description,
            publish_date: publish_date,
            source: source,
            source_link: source_link);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
