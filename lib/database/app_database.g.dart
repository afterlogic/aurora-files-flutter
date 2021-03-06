// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class LocalFile extends DataClass implements Insertable<LocalFile> {
  final int localId;
  final String id;
  final String guid;
  final String type;
  final String path;
  final String fullPath;
  final String localPath;
  final String name;
  final int size;
  final bool isFolder;
  final bool isOpenable;
  final bool isLink;
  final String linkType;
  final String linkUrl;
  final int lastModified;
  final String contentType;
  final String oEmbedHtml;
  final bool published;
  final String owner;
  final String content;
  final String viewUrl;
  final String downloadUrl;
  final String thumbnailUrl;
  final String hash;
  final String extendedProps;
  final bool isExternal;
  final String initVector;
  final String linkPassword;
  final String encryptedDecryptionKey;
  LocalFile(
      {@required this.localId,
      @required this.id,
      this.guid,
      @required this.type,
      @required this.path,
      @required this.fullPath,
      @required this.localPath,
      @required this.name,
      @required this.size,
      @required this.isFolder,
      @required this.isOpenable,
      @required this.isLink,
      @required this.linkType,
      @required this.linkUrl,
      @required this.lastModified,
      @required this.contentType,
      @required this.oEmbedHtml,
      @required this.published,
      @required this.owner,
      @required this.content,
      @required this.viewUrl,
      @required this.downloadUrl,
      this.thumbnailUrl,
      @required this.hash,
      @required this.extendedProps,
      @required this.isExternal,
      this.initVector,
      this.linkPassword,
      this.encryptedDecryptionKey});
  factory LocalFile.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return LocalFile(
      localId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}local_id']),
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      guid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}guid']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      path: stringType.mapFromDatabaseResponse(data['${effectivePrefix}path']),
      fullPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}full_path']),
      localPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}local_path']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      size: intType.mapFromDatabaseResponse(data['${effectivePrefix}size']),
      isFolder:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_folder']),
      isOpenable: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_openable']),
      isLink:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_link']),
      linkType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}link_type']),
      linkUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}link_url']),
      lastModified: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_modified']),
      contentType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}content_type']),
      oEmbedHtml: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}o_embed_html']),
      published:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}published']),
      owner:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}owner']),
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}content']),
      viewUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}view_url']),
      downloadUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}download_url']),
      thumbnailUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}thumbnail_url']),
      hash: stringType.mapFromDatabaseResponse(data['${effectivePrefix}hash']),
      extendedProps: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}extended_props']),
      isExternal: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_external']),
      initVector: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}init_vector']),
      linkPassword: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}link_password']),
      encryptedDecryptionKey: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}encrypted_decryption_key']),
    );
  }
  factory LocalFile.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return LocalFile(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<String>(json['id']),
      guid: serializer.fromJson<String>(json['guid']),
      type: serializer.fromJson<String>(json['type']),
      path: serializer.fromJson<String>(json['path']),
      fullPath: serializer.fromJson<String>(json['fullPath']),
      localPath: serializer.fromJson<String>(json['localPath']),
      name: serializer.fromJson<String>(json['name']),
      size: serializer.fromJson<int>(json['size']),
      isFolder: serializer.fromJson<bool>(json['isFolder']),
      isOpenable: serializer.fromJson<bool>(json['isOpenable']),
      isLink: serializer.fromJson<bool>(json['isLink']),
      linkType: serializer.fromJson<String>(json['linkType']),
      linkUrl: serializer.fromJson<String>(json['linkUrl']),
      lastModified: serializer.fromJson<int>(json['lastModified']),
      contentType: serializer.fromJson<String>(json['contentType']),
      oEmbedHtml: serializer.fromJson<String>(json['oEmbedHtml']),
      published: serializer.fromJson<bool>(json['published']),
      owner: serializer.fromJson<String>(json['owner']),
      content: serializer.fromJson<String>(json['content']),
      viewUrl: serializer.fromJson<String>(json['viewUrl']),
      downloadUrl: serializer.fromJson<String>(json['downloadUrl']),
      thumbnailUrl: serializer.fromJson<String>(json['thumbnailUrl']),
      hash: serializer.fromJson<String>(json['hash']),
      extendedProps: serializer.fromJson<String>(json['extendedProps']),
      isExternal: serializer.fromJson<bool>(json['isExternal']),
      initVector: serializer.fromJson<String>(json['initVector']),
      linkPassword: serializer.fromJson<String>(json['linkPassword']),
      encryptedDecryptionKey:
          serializer.fromJson<String>(json['encryptedDecryptionKey']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<String>(id),
      'guid': serializer.toJson<String>(guid),
      'type': serializer.toJson<String>(type),
      'path': serializer.toJson<String>(path),
      'fullPath': serializer.toJson<String>(fullPath),
      'localPath': serializer.toJson<String>(localPath),
      'name': serializer.toJson<String>(name),
      'size': serializer.toJson<int>(size),
      'isFolder': serializer.toJson<bool>(isFolder),
      'isOpenable': serializer.toJson<bool>(isOpenable),
      'isLink': serializer.toJson<bool>(isLink),
      'linkType': serializer.toJson<String>(linkType),
      'linkUrl': serializer.toJson<String>(linkUrl),
      'lastModified': serializer.toJson<int>(lastModified),
      'contentType': serializer.toJson<String>(contentType),
      'oEmbedHtml': serializer.toJson<String>(oEmbedHtml),
      'published': serializer.toJson<bool>(published),
      'owner': serializer.toJson<String>(owner),
      'content': serializer.toJson<String>(content),
      'viewUrl': serializer.toJson<String>(viewUrl),
      'downloadUrl': serializer.toJson<String>(downloadUrl),
      'thumbnailUrl': serializer.toJson<String>(thumbnailUrl),
      'hash': serializer.toJson<String>(hash),
      'extendedProps': serializer.toJson<String>(extendedProps),
      'isExternal': serializer.toJson<bool>(isExternal),
      'initVector': serializer.toJson<String>(initVector),
      'linkPassword': serializer.toJson<String>(linkPassword),
      'encryptedDecryptionKey':
          serializer.toJson<String>(encryptedDecryptionKey),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<LocalFile>>(bool nullToAbsent) {
    return FilesCompanion(
      localId: localId == null && nullToAbsent
          ? const Value.absent()
          : Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      guid: guid == null && nullToAbsent ? const Value.absent() : Value(guid),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      path: path == null && nullToAbsent ? const Value.absent() : Value(path),
      fullPath: fullPath == null && nullToAbsent
          ? const Value.absent()
          : Value(fullPath),
      localPath: localPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localPath),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      size: size == null && nullToAbsent ? const Value.absent() : Value(size),
      isFolder: isFolder == null && nullToAbsent
          ? const Value.absent()
          : Value(isFolder),
      isOpenable: isOpenable == null && nullToAbsent
          ? const Value.absent()
          : Value(isOpenable),
      isLink:
          isLink == null && nullToAbsent ? const Value.absent() : Value(isLink),
      linkType: linkType == null && nullToAbsent
          ? const Value.absent()
          : Value(linkType),
      linkUrl: linkUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(linkUrl),
      lastModified: lastModified == null && nullToAbsent
          ? const Value.absent()
          : Value(lastModified),
      contentType: contentType == null && nullToAbsent
          ? const Value.absent()
          : Value(contentType),
      oEmbedHtml: oEmbedHtml == null && nullToAbsent
          ? const Value.absent()
          : Value(oEmbedHtml),
      published: published == null && nullToAbsent
          ? const Value.absent()
          : Value(published),
      owner:
          owner == null && nullToAbsent ? const Value.absent() : Value(owner),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      viewUrl: viewUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(viewUrl),
      downloadUrl: downloadUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(downloadUrl),
      thumbnailUrl: thumbnailUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailUrl),
      hash: hash == null && nullToAbsent ? const Value.absent() : Value(hash),
      extendedProps: extendedProps == null && nullToAbsent
          ? const Value.absent()
          : Value(extendedProps),
      isExternal: isExternal == null && nullToAbsent
          ? const Value.absent()
          : Value(isExternal),
      initVector: initVector == null && nullToAbsent
          ? const Value.absent()
          : Value(initVector),
      linkPassword: linkPassword == null && nullToAbsent
          ? const Value.absent()
          : Value(linkPassword),
      encryptedDecryptionKey: encryptedDecryptionKey == null && nullToAbsent
          ? const Value.absent()
          : Value(encryptedDecryptionKey),
    ) as T;
  }

  LocalFile copyWith(
          {int localId,
          String id,
          String guid,
          String type,
          String path,
          String fullPath,
          String localPath,
          String name,
          int size,
          bool isFolder,
          bool isOpenable,
          bool isLink,
          String linkType,
          String linkUrl,
          int lastModified,
          String contentType,
          String oEmbedHtml,
          bool published,
          String owner,
          String content,
          String viewUrl,
          String downloadUrl,
          String thumbnailUrl,
          String hash,
          String extendedProps,
          bool isExternal,
          String initVector,
          String linkPassword,
          String encryptedDecryptionKey}) =>
      LocalFile(
        localId: localId ?? this.localId,
        id: id ?? this.id,
        guid: guid ?? this.guid,
        type: type ?? this.type,
        path: path ?? this.path,
        fullPath: fullPath ?? this.fullPath,
        localPath: localPath ?? this.localPath,
        name: name ?? this.name,
        size: size ?? this.size,
        isFolder: isFolder ?? this.isFolder,
        isOpenable: isOpenable ?? this.isOpenable,
        isLink: isLink ?? this.isLink,
        linkType: linkType ?? this.linkType,
        linkUrl: linkUrl ?? this.linkUrl,
        lastModified: lastModified ?? this.lastModified,
        contentType: contentType ?? this.contentType,
        oEmbedHtml: oEmbedHtml ?? this.oEmbedHtml,
        published: published ?? this.published,
        owner: owner ?? this.owner,
        content: content ?? this.content,
        viewUrl: viewUrl ?? this.viewUrl,
        downloadUrl: downloadUrl ?? this.downloadUrl,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
        hash: hash ?? this.hash,
        extendedProps: extendedProps ?? this.extendedProps,
        isExternal: isExternal ?? this.isExternal,
        initVector: initVector ?? this.initVector,
        linkPassword: linkPassword ?? this.linkPassword,
        encryptedDecryptionKey:
            encryptedDecryptionKey ?? this.encryptedDecryptionKey,
      );
  @override
  String toString() {
    return (StringBuffer('LocalFile(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('guid: $guid, ')
          ..write('type: $type, ')
          ..write('path: $path, ')
          ..write('fullPath: $fullPath, ')
          ..write('localPath: $localPath, ')
          ..write('name: $name, ')
          ..write('size: $size, ')
          ..write('isFolder: $isFolder, ')
          ..write('isOpenable: $isOpenable, ')
          ..write('isLink: $isLink, ')
          ..write('linkType: $linkType, ')
          ..write('linkUrl: $linkUrl, ')
          ..write('lastModified: $lastModified, ')
          ..write('contentType: $contentType, ')
          ..write('oEmbedHtml: $oEmbedHtml, ')
          ..write('published: $published, ')
          ..write('owner: $owner, ')
          ..write('content: $content, ')
          ..write('viewUrl: $viewUrl, ')
          ..write('downloadUrl: $downloadUrl, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('hash: $hash, ')
          ..write('extendedProps: $extendedProps, ')
          ..write('isExternal: $isExternal, ')
          ..write('initVector: $initVector, ')
          ..write('linkPassword: $linkPassword, ')
          ..write('encryptedDecryptionKey: $encryptedDecryptionKey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      localId.hashCode,
      $mrjc(
          id.hashCode,
          $mrjc(
              guid.hashCode,
              $mrjc(
                  type.hashCode,
                  $mrjc(
                      path.hashCode,
                      $mrjc(
                          fullPath.hashCode,
                          $mrjc(
                              localPath.hashCode,
                              $mrjc(
                                  name.hashCode,
                                  $mrjc(
                                      size.hashCode,
                                      $mrjc(
                                          isFolder.hashCode,
                                          $mrjc(
                                              isOpenable.hashCode,
                                              $mrjc(
                                                  isLink.hashCode,
                                                  $mrjc(
                                                      linkType.hashCode,
                                                      $mrjc(
                                                          linkUrl.hashCode,
                                                          $mrjc(
                                                              lastModified
                                                                  .hashCode,
                                                              $mrjc(
                                                                  contentType
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      oEmbedHtml
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          published
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              owner.hashCode,
                                                                              $mrjc(content.hashCode, $mrjc(viewUrl.hashCode, $mrjc(downloadUrl.hashCode, $mrjc(thumbnailUrl.hashCode, $mrjc(hash.hashCode, $mrjc(extendedProps.hashCode, $mrjc(isExternal.hashCode, $mrjc(initVector.hashCode, $mrjc(linkPassword.hashCode, encryptedDecryptionKey.hashCode)))))))))))))))))))))))))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is LocalFile &&
          other.localId == localId &&
          other.id == id &&
          other.guid == guid &&
          other.type == type &&
          other.path == path &&
          other.fullPath == fullPath &&
          other.localPath == localPath &&
          other.name == name &&
          other.size == size &&
          other.isFolder == isFolder &&
          other.isOpenable == isOpenable &&
          other.isLink == isLink &&
          other.linkType == linkType &&
          other.linkUrl == linkUrl &&
          other.lastModified == lastModified &&
          other.contentType == contentType &&
          other.oEmbedHtml == oEmbedHtml &&
          other.published == published &&
          other.owner == owner &&
          other.content == content &&
          other.viewUrl == viewUrl &&
          other.downloadUrl == downloadUrl &&
          other.thumbnailUrl == thumbnailUrl &&
          other.hash == hash &&
          other.extendedProps == extendedProps &&
          other.isExternal == isExternal &&
          other.initVector == initVector &&
          other.linkPassword == linkPassword &&
          other.encryptedDecryptionKey == encryptedDecryptionKey);
}

class FilesCompanion extends UpdateCompanion<LocalFile> {
  final Value<int> localId;
  final Value<String> id;
  final Value<String> guid;
  final Value<String> type;
  final Value<String> path;
  final Value<String> fullPath;
  final Value<String> localPath;
  final Value<String> name;
  final Value<int> size;
  final Value<bool> isFolder;
  final Value<bool> isOpenable;
  final Value<bool> isLink;
  final Value<String> linkType;
  final Value<String> linkUrl;
  final Value<int> lastModified;
  final Value<String> contentType;
  final Value<String> oEmbedHtml;
  final Value<bool> published;
  final Value<String> owner;
  final Value<String> content;
  final Value<String> viewUrl;
  final Value<String> downloadUrl;
  final Value<String> thumbnailUrl;
  final Value<String> hash;
  final Value<String> extendedProps;
  final Value<bool> isExternal;
  final Value<String> initVector;
  final Value<String> linkPassword;
  final Value<String> encryptedDecryptionKey;
  const FilesCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.guid = const Value.absent(),
    this.type = const Value.absent(),
    this.path = const Value.absent(),
    this.fullPath = const Value.absent(),
    this.localPath = const Value.absent(),
    this.name = const Value.absent(),
    this.size = const Value.absent(),
    this.isFolder = const Value.absent(),
    this.isOpenable = const Value.absent(),
    this.isLink = const Value.absent(),
    this.linkType = const Value.absent(),
    this.linkUrl = const Value.absent(),
    this.lastModified = const Value.absent(),
    this.contentType = const Value.absent(),
    this.oEmbedHtml = const Value.absent(),
    this.published = const Value.absent(),
    this.owner = const Value.absent(),
    this.content = const Value.absent(),
    this.viewUrl = const Value.absent(),
    this.downloadUrl = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
    this.hash = const Value.absent(),
    this.extendedProps = const Value.absent(),
    this.isExternal = const Value.absent(),
    this.initVector = const Value.absent(),
    this.linkPassword = const Value.absent(),
    this.encryptedDecryptionKey = const Value.absent(),
  });
  FilesCompanion copyWith(
      {Value<int> localId,
      Value<String> id,
      Value<String> guid,
      Value<String> type,
      Value<String> path,
      Value<String> fullPath,
      Value<String> localPath,
      Value<String> name,
      Value<int> size,
      Value<bool> isFolder,
      Value<bool> isOpenable,
      Value<bool> isLink,
      Value<String> linkType,
      Value<String> linkUrl,
      Value<int> lastModified,
      Value<String> contentType,
      Value<String> oEmbedHtml,
      Value<bool> published,
      Value<String> owner,
      Value<String> content,
      Value<String> viewUrl,
      Value<String> downloadUrl,
      Value<String> thumbnailUrl,
      Value<String> hash,
      Value<String> extendedProps,
      Value<bool> isExternal,
      Value<String> initVector,
      Value<String> linkPassword,
      Value<String> encryptedDecryptionKey}) {
    return FilesCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      guid: guid ?? this.guid,
      type: type ?? this.type,
      path: path ?? this.path,
      fullPath: fullPath ?? this.fullPath,
      localPath: localPath ?? this.localPath,
      name: name ?? this.name,
      size: size ?? this.size,
      isFolder: isFolder ?? this.isFolder,
      isOpenable: isOpenable ?? this.isOpenable,
      isLink: isLink ?? this.isLink,
      linkType: linkType ?? this.linkType,
      linkUrl: linkUrl ?? this.linkUrl,
      lastModified: lastModified ?? this.lastModified,
      contentType: contentType ?? this.contentType,
      oEmbedHtml: oEmbedHtml ?? this.oEmbedHtml,
      published: published ?? this.published,
      owner: owner ?? this.owner,
      content: content ?? this.content,
      viewUrl: viewUrl ?? this.viewUrl,
      downloadUrl: downloadUrl ?? this.downloadUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      hash: hash ?? this.hash,
      extendedProps: extendedProps ?? this.extendedProps,
      isExternal: isExternal ?? this.isExternal,
      initVector: initVector ?? this.initVector,
      linkPassword: linkPassword ?? this.linkPassword,
      encryptedDecryptionKey:
          encryptedDecryptionKey ?? this.encryptedDecryptionKey,
    );
  }
}

class $FilesTable extends Files with TableInfo<$FilesTable, LocalFile> {
  final GeneratedDatabase _db;
  final String _alias;
  $FilesTable(this._db, [this._alias]);
  final VerificationMeta _localIdMeta = const VerificationMeta('localId');
  GeneratedIntColumn _localId;
  @override
  GeneratedIntColumn get localId => _localId ??= _constructLocalId();
  GeneratedIntColumn _constructLocalId() {
    return GeneratedIntColumn('local_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  GeneratedTextColumn _guid;
  @override
  GeneratedTextColumn get guid => _guid ??= _constructGuid();
  GeneratedTextColumn _constructGuid() {
    return GeneratedTextColumn(
      'guid',
      $tableName,
      true,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn(
      'type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pathMeta = const VerificationMeta('path');
  GeneratedTextColumn _path;
  @override
  GeneratedTextColumn get path => _path ??= _constructPath();
  GeneratedTextColumn _constructPath() {
    return GeneratedTextColumn(
      'path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fullPathMeta = const VerificationMeta('fullPath');
  GeneratedTextColumn _fullPath;
  @override
  GeneratedTextColumn get fullPath => _fullPath ??= _constructFullPath();
  GeneratedTextColumn _constructFullPath() {
    return GeneratedTextColumn(
      'full_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _localPathMeta = const VerificationMeta('localPath');
  GeneratedTextColumn _localPath;
  @override
  GeneratedTextColumn get localPath => _localPath ??= _constructLocalPath();
  GeneratedTextColumn _constructLocalPath() {
    return GeneratedTextColumn(
      'local_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _sizeMeta = const VerificationMeta('size');
  GeneratedIntColumn _size;
  @override
  GeneratedIntColumn get size => _size ??= _constructSize();
  GeneratedIntColumn _constructSize() {
    return GeneratedIntColumn(
      'size',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isFolderMeta = const VerificationMeta('isFolder');
  GeneratedBoolColumn _isFolder;
  @override
  GeneratedBoolColumn get isFolder => _isFolder ??= _constructIsFolder();
  GeneratedBoolColumn _constructIsFolder() {
    return GeneratedBoolColumn(
      'is_folder',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isOpenableMeta = const VerificationMeta('isOpenable');
  GeneratedBoolColumn _isOpenable;
  @override
  GeneratedBoolColumn get isOpenable => _isOpenable ??= _constructIsOpenable();
  GeneratedBoolColumn _constructIsOpenable() {
    return GeneratedBoolColumn(
      'is_openable',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isLinkMeta = const VerificationMeta('isLink');
  GeneratedBoolColumn _isLink;
  @override
  GeneratedBoolColumn get isLink => _isLink ??= _constructIsLink();
  GeneratedBoolColumn _constructIsLink() {
    return GeneratedBoolColumn(
      'is_link',
      $tableName,
      false,
    );
  }

  final VerificationMeta _linkTypeMeta = const VerificationMeta('linkType');
  GeneratedTextColumn _linkType;
  @override
  GeneratedTextColumn get linkType => _linkType ??= _constructLinkType();
  GeneratedTextColumn _constructLinkType() {
    return GeneratedTextColumn(
      'link_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _linkUrlMeta = const VerificationMeta('linkUrl');
  GeneratedTextColumn _linkUrl;
  @override
  GeneratedTextColumn get linkUrl => _linkUrl ??= _constructLinkUrl();
  GeneratedTextColumn _constructLinkUrl() {
    return GeneratedTextColumn(
      'link_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lastModifiedMeta =
      const VerificationMeta('lastModified');
  GeneratedIntColumn _lastModified;
  @override
  GeneratedIntColumn get lastModified =>
      _lastModified ??= _constructLastModified();
  GeneratedIntColumn _constructLastModified() {
    return GeneratedIntColumn(
      'last_modified',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentTypeMeta =
      const VerificationMeta('contentType');
  GeneratedTextColumn _contentType;
  @override
  GeneratedTextColumn get contentType =>
      _contentType ??= _constructContentType();
  GeneratedTextColumn _constructContentType() {
    return GeneratedTextColumn(
      'content_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _oEmbedHtmlMeta = const VerificationMeta('oEmbedHtml');
  GeneratedTextColumn _oEmbedHtml;
  @override
  GeneratedTextColumn get oEmbedHtml => _oEmbedHtml ??= _constructOEmbedHtml();
  GeneratedTextColumn _constructOEmbedHtml() {
    return GeneratedTextColumn(
      'o_embed_html',
      $tableName,
      false,
    );
  }

  final VerificationMeta _publishedMeta = const VerificationMeta('published');
  GeneratedBoolColumn _published;
  @override
  GeneratedBoolColumn get published => _published ??= _constructPublished();
  GeneratedBoolColumn _constructPublished() {
    return GeneratedBoolColumn(
      'published',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ownerMeta = const VerificationMeta('owner');
  GeneratedTextColumn _owner;
  @override
  GeneratedTextColumn get owner => _owner ??= _constructOwner();
  GeneratedTextColumn _constructOwner() {
    return GeneratedTextColumn(
      'owner',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  GeneratedTextColumn _content;
  @override
  GeneratedTextColumn get content => _content ??= _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    );
  }

  final VerificationMeta _viewUrlMeta = const VerificationMeta('viewUrl');
  GeneratedTextColumn _viewUrl;
  @override
  GeneratedTextColumn get viewUrl => _viewUrl ??= _constructViewUrl();
  GeneratedTextColumn _constructViewUrl() {
    return GeneratedTextColumn(
      'view_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _downloadUrlMeta =
      const VerificationMeta('downloadUrl');
  GeneratedTextColumn _downloadUrl;
  @override
  GeneratedTextColumn get downloadUrl =>
      _downloadUrl ??= _constructDownloadUrl();
  GeneratedTextColumn _constructDownloadUrl() {
    return GeneratedTextColumn(
      'download_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _thumbnailUrlMeta =
      const VerificationMeta('thumbnailUrl');
  GeneratedTextColumn _thumbnailUrl;
  @override
  GeneratedTextColumn get thumbnailUrl =>
      _thumbnailUrl ??= _constructThumbnailUrl();
  GeneratedTextColumn _constructThumbnailUrl() {
    return GeneratedTextColumn(
      'thumbnail_url',
      $tableName,
      true,
    );
  }

  final VerificationMeta _hashMeta = const VerificationMeta('hash');
  GeneratedTextColumn _hash;
  @override
  GeneratedTextColumn get hash => _hash ??= _constructHash();
  GeneratedTextColumn _constructHash() {
    return GeneratedTextColumn(
      'hash',
      $tableName,
      false,
    );
  }

  final VerificationMeta _extendedPropsMeta =
      const VerificationMeta('extendedProps');
  GeneratedTextColumn _extendedProps;
  @override
  GeneratedTextColumn get extendedProps =>
      _extendedProps ??= _constructExtendedProps();
  GeneratedTextColumn _constructExtendedProps() {
    return GeneratedTextColumn(
      'extended_props',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isExternalMeta = const VerificationMeta('isExternal');
  GeneratedBoolColumn _isExternal;
  @override
  GeneratedBoolColumn get isExternal => _isExternal ??= _constructIsExternal();
  GeneratedBoolColumn _constructIsExternal() {
    return GeneratedBoolColumn(
      'is_external',
      $tableName,
      false,
    );
  }

  final VerificationMeta _initVectorMeta = const VerificationMeta('initVector');
  GeneratedTextColumn _initVector;
  @override
  GeneratedTextColumn get initVector => _initVector ??= _constructInitVector();
  GeneratedTextColumn _constructInitVector() {
    return GeneratedTextColumn(
      'init_vector',
      $tableName,
      true,
    );
  }

  final VerificationMeta _linkPasswordMeta =
      const VerificationMeta('linkPassword');
  GeneratedTextColumn _linkPassword;
  @override
  GeneratedTextColumn get linkPassword =>
      _linkPassword ??= _constructLinkPassword();
  GeneratedTextColumn _constructLinkPassword() {
    return GeneratedTextColumn(
      'link_password',
      $tableName,
      true,
    );
  }

  final VerificationMeta _encryptedDecryptionKeyMeta =
      const VerificationMeta('encryptedDecryptionKey');
  GeneratedTextColumn _encryptedDecryptionKey;
  @override
  GeneratedTextColumn get encryptedDecryptionKey =>
      _encryptedDecryptionKey ??= _constructEncryptedDecryptionKey();
  GeneratedTextColumn _constructEncryptedDecryptionKey() {
    return GeneratedTextColumn(
      'encrypted_decryption_key',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        localId,
        id,
        guid,
        type,
        path,
        fullPath,
        localPath,
        name,
        size,
        isFolder,
        isOpenable,
        isLink,
        linkType,
        linkUrl,
        lastModified,
        contentType,
        oEmbedHtml,
        published,
        owner,
        content,
        viewUrl,
        downloadUrl,
        thumbnailUrl,
        hash,
        extendedProps,
        isExternal,
        initVector,
        linkPassword,
        encryptedDecryptionKey
      ];
  @override
  $FilesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'files';
  @override
  final String actualTableName = 'files';
  @override
  VerificationContext validateIntegrity(FilesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.localId.present) {
      context.handle(_localIdMeta,
          localId.isAcceptableValue(d.localId.value, _localIdMeta));
    } else if (localId.isRequired && isInserting) {
      context.missing(_localIdMeta);
    }
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.guid.present) {
      context.handle(
          _guidMeta, guid.isAcceptableValue(d.guid.value, _guidMeta));
    } else if (guid.isRequired && isInserting) {
      context.missing(_guidMeta);
    }
    if (d.type.present) {
      context.handle(
          _typeMeta, type.isAcceptableValue(d.type.value, _typeMeta));
    } else if (type.isRequired && isInserting) {
      context.missing(_typeMeta);
    }
    if (d.path.present) {
      context.handle(
          _pathMeta, path.isAcceptableValue(d.path.value, _pathMeta));
    } else if (path.isRequired && isInserting) {
      context.missing(_pathMeta);
    }
    if (d.fullPath.present) {
      context.handle(_fullPathMeta,
          fullPath.isAcceptableValue(d.fullPath.value, _fullPathMeta));
    } else if (fullPath.isRequired && isInserting) {
      context.missing(_fullPathMeta);
    }
    if (d.localPath.present) {
      context.handle(_localPathMeta,
          localPath.isAcceptableValue(d.localPath.value, _localPathMeta));
    } else if (localPath.isRequired && isInserting) {
      context.missing(_localPathMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.size.present) {
      context.handle(
          _sizeMeta, size.isAcceptableValue(d.size.value, _sizeMeta));
    } else if (size.isRequired && isInserting) {
      context.missing(_sizeMeta);
    }
    if (d.isFolder.present) {
      context.handle(_isFolderMeta,
          isFolder.isAcceptableValue(d.isFolder.value, _isFolderMeta));
    } else if (isFolder.isRequired && isInserting) {
      context.missing(_isFolderMeta);
    }
    if (d.isOpenable.present) {
      context.handle(_isOpenableMeta,
          isOpenable.isAcceptableValue(d.isOpenable.value, _isOpenableMeta));
    } else if (isOpenable.isRequired && isInserting) {
      context.missing(_isOpenableMeta);
    }
    if (d.isLink.present) {
      context.handle(
          _isLinkMeta, isLink.isAcceptableValue(d.isLink.value, _isLinkMeta));
    } else if (isLink.isRequired && isInserting) {
      context.missing(_isLinkMeta);
    }
    if (d.linkType.present) {
      context.handle(_linkTypeMeta,
          linkType.isAcceptableValue(d.linkType.value, _linkTypeMeta));
    } else if (linkType.isRequired && isInserting) {
      context.missing(_linkTypeMeta);
    }
    if (d.linkUrl.present) {
      context.handle(_linkUrlMeta,
          linkUrl.isAcceptableValue(d.linkUrl.value, _linkUrlMeta));
    } else if (linkUrl.isRequired && isInserting) {
      context.missing(_linkUrlMeta);
    }
    if (d.lastModified.present) {
      context.handle(
          _lastModifiedMeta,
          lastModified.isAcceptableValue(
              d.lastModified.value, _lastModifiedMeta));
    } else if (lastModified.isRequired && isInserting) {
      context.missing(_lastModifiedMeta);
    }
    if (d.contentType.present) {
      context.handle(_contentTypeMeta,
          contentType.isAcceptableValue(d.contentType.value, _contentTypeMeta));
    } else if (contentType.isRequired && isInserting) {
      context.missing(_contentTypeMeta);
    }
    if (d.oEmbedHtml.present) {
      context.handle(_oEmbedHtmlMeta,
          oEmbedHtml.isAcceptableValue(d.oEmbedHtml.value, _oEmbedHtmlMeta));
    } else if (oEmbedHtml.isRequired && isInserting) {
      context.missing(_oEmbedHtmlMeta);
    }
    if (d.published.present) {
      context.handle(_publishedMeta,
          published.isAcceptableValue(d.published.value, _publishedMeta));
    } else if (published.isRequired && isInserting) {
      context.missing(_publishedMeta);
    }
    if (d.owner.present) {
      context.handle(
          _ownerMeta, owner.isAcceptableValue(d.owner.value, _ownerMeta));
    } else if (owner.isRequired && isInserting) {
      context.missing(_ownerMeta);
    }
    if (d.content.present) {
      context.handle(_contentMeta,
          content.isAcceptableValue(d.content.value, _contentMeta));
    } else if (content.isRequired && isInserting) {
      context.missing(_contentMeta);
    }
    if (d.viewUrl.present) {
      context.handle(_viewUrlMeta,
          viewUrl.isAcceptableValue(d.viewUrl.value, _viewUrlMeta));
    } else if (viewUrl.isRequired && isInserting) {
      context.missing(_viewUrlMeta);
    }
    if (d.downloadUrl.present) {
      context.handle(_downloadUrlMeta,
          downloadUrl.isAcceptableValue(d.downloadUrl.value, _downloadUrlMeta));
    } else if (downloadUrl.isRequired && isInserting) {
      context.missing(_downloadUrlMeta);
    }
    if (d.thumbnailUrl.present) {
      context.handle(
          _thumbnailUrlMeta,
          thumbnailUrl.isAcceptableValue(
              d.thumbnailUrl.value, _thumbnailUrlMeta));
    } else if (thumbnailUrl.isRequired && isInserting) {
      context.missing(_thumbnailUrlMeta);
    }
    if (d.hash.present) {
      context.handle(
          _hashMeta, hash.isAcceptableValue(d.hash.value, _hashMeta));
    } else if (hash.isRequired && isInserting) {
      context.missing(_hashMeta);
    }
    if (d.extendedProps.present) {
      context.handle(
          _extendedPropsMeta,
          extendedProps.isAcceptableValue(
              d.extendedProps.value, _extendedPropsMeta));
    } else if (extendedProps.isRequired && isInserting) {
      context.missing(_extendedPropsMeta);
    }
    if (d.isExternal.present) {
      context.handle(_isExternalMeta,
          isExternal.isAcceptableValue(d.isExternal.value, _isExternalMeta));
    } else if (isExternal.isRequired && isInserting) {
      context.missing(_isExternalMeta);
    }
    if (d.initVector.present) {
      context.handle(_initVectorMeta,
          initVector.isAcceptableValue(d.initVector.value, _initVectorMeta));
    } else if (initVector.isRequired && isInserting) {
      context.missing(_initVectorMeta);
    }
    if (d.linkPassword.present) {
      context.handle(
          _linkPasswordMeta,
          linkPassword.isAcceptableValue(
              d.linkPassword.value, _linkPasswordMeta));
    } else if (linkPassword.isRequired && isInserting) {
      context.missing(_linkPasswordMeta);
    }
    if (d.encryptedDecryptionKey.present) {
      context.handle(
          _encryptedDecryptionKeyMeta,
          encryptedDecryptionKey.isAcceptableValue(
              d.encryptedDecryptionKey.value, _encryptedDecryptionKeyMeta));
    } else if (encryptedDecryptionKey.isRequired && isInserting) {
      context.missing(_encryptedDecryptionKeyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  LocalFile map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return LocalFile.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(FilesCompanion d) {
    final map = <String, Variable>{};
    if (d.localId.present) {
      map['local_id'] = Variable<int, IntType>(d.localId.value);
    }
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.guid.present) {
      map['guid'] = Variable<String, StringType>(d.guid.value);
    }
    if (d.type.present) {
      map['type'] = Variable<String, StringType>(d.type.value);
    }
    if (d.path.present) {
      map['path'] = Variable<String, StringType>(d.path.value);
    }
    if (d.fullPath.present) {
      map['full_path'] = Variable<String, StringType>(d.fullPath.value);
    }
    if (d.localPath.present) {
      map['local_path'] = Variable<String, StringType>(d.localPath.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.size.present) {
      map['size'] = Variable<int, IntType>(d.size.value);
    }
    if (d.isFolder.present) {
      map['is_folder'] = Variable<bool, BoolType>(d.isFolder.value);
    }
    if (d.isOpenable.present) {
      map['is_openable'] = Variable<bool, BoolType>(d.isOpenable.value);
    }
    if (d.isLink.present) {
      map['is_link'] = Variable<bool, BoolType>(d.isLink.value);
    }
    if (d.linkType.present) {
      map['link_type'] = Variable<String, StringType>(d.linkType.value);
    }
    if (d.linkUrl.present) {
      map['link_url'] = Variable<String, StringType>(d.linkUrl.value);
    }
    if (d.lastModified.present) {
      map['last_modified'] = Variable<int, IntType>(d.lastModified.value);
    }
    if (d.contentType.present) {
      map['content_type'] = Variable<String, StringType>(d.contentType.value);
    }
    if (d.oEmbedHtml.present) {
      map['o_embed_html'] = Variable<String, StringType>(d.oEmbedHtml.value);
    }
    if (d.published.present) {
      map['published'] = Variable<bool, BoolType>(d.published.value);
    }
    if (d.owner.present) {
      map['owner'] = Variable<String, StringType>(d.owner.value);
    }
    if (d.content.present) {
      map['content'] = Variable<String, StringType>(d.content.value);
    }
    if (d.viewUrl.present) {
      map['view_url'] = Variable<String, StringType>(d.viewUrl.value);
    }
    if (d.downloadUrl.present) {
      map['download_url'] = Variable<String, StringType>(d.downloadUrl.value);
    }
    if (d.thumbnailUrl.present) {
      map['thumbnail_url'] = Variable<String, StringType>(d.thumbnailUrl.value);
    }
    if (d.hash.present) {
      map['hash'] = Variable<String, StringType>(d.hash.value);
    }
    if (d.extendedProps.present) {
      map['extended_props'] =
          Variable<String, StringType>(d.extendedProps.value);
    }
    if (d.isExternal.present) {
      map['is_external'] = Variable<bool, BoolType>(d.isExternal.value);
    }
    if (d.initVector.present) {
      map['init_vector'] = Variable<String, StringType>(d.initVector.value);
    }
    if (d.linkPassword.present) {
      map['link_password'] = Variable<String, StringType>(d.linkPassword.value);
    }
    if (d.encryptedDecryptionKey.present) {
      map['encrypted_decryption_key'] =
          Variable<String, StringType>(d.encryptedDecryptionKey.value);
    }
    return map;
  }

  @override
  $FilesTable createAlias(String alias) {
    return $FilesTable(_db, alias);
  }
}

class LocalPgpKey extends DataClass implements Insertable<LocalPgpKey> {
  final int id;
  final String email;
  final String key;
  final bool isPrivate;
  final int length;
  final String name;
  LocalPgpKey(
      {@required this.id,
      @required this.email,
      @required this.key,
      @required this.isPrivate,
      this.length,
      @required this.name});
  factory LocalPgpKey.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return LocalPgpKey(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      key: stringType.mapFromDatabaseResponse(data['${effectivePrefix}key']),
      isPrivate: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_private']),
      length: intType.mapFromDatabaseResponse(data['${effectivePrefix}length']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  factory LocalPgpKey.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return LocalPgpKey(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      key: serializer.fromJson<String>(json['key']),
      isPrivate: serializer.fromJson<bool>(json['isPrivate']),
      length: serializer.fromJson<int>(json['length']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String>(email),
      'key': serializer.toJson<String>(key),
      'isPrivate': serializer.toJson<bool>(isPrivate),
      'length': serializer.toJson<int>(length),
      'name': serializer.toJson<String>(name),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<LocalPgpKey>>(bool nullToAbsent) {
    return PgpKeyCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      key: key == null && nullToAbsent ? const Value.absent() : Value(key),
      isPrivate: isPrivate == null && nullToAbsent
          ? const Value.absent()
          : Value(isPrivate),
      length:
          length == null && nullToAbsent ? const Value.absent() : Value(length),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    ) as T;
  }

  LocalPgpKey copyWith(
          {int id,
          String email,
          String key,
          bool isPrivate,
          int length,
          String name}) =>
      LocalPgpKey(
        id: id ?? this.id,
        email: email ?? this.email,
        key: key ?? this.key,
        isPrivate: isPrivate ?? this.isPrivate,
        length: length ?? this.length,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('LocalPgpKey(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('key: $key, ')
          ..write('isPrivate: $isPrivate, ')
          ..write('length: $length, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          email.hashCode,
          $mrjc(
              key.hashCode,
              $mrjc(isPrivate.hashCode,
                  $mrjc(length.hashCode, name.hashCode))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is LocalPgpKey &&
          other.id == id &&
          other.email == email &&
          other.key == key &&
          other.isPrivate == isPrivate &&
          other.length == length &&
          other.name == name);
}

class PgpKeyCompanion extends UpdateCompanion<LocalPgpKey> {
  final Value<int> id;
  final Value<String> email;
  final Value<String> key;
  final Value<bool> isPrivate;
  final Value<int> length;
  final Value<String> name;
  const PgpKeyCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.key = const Value.absent(),
    this.isPrivate = const Value.absent(),
    this.length = const Value.absent(),
    this.name = const Value.absent(),
  });
  PgpKeyCompanion copyWith(
      {Value<int> id,
      Value<String> email,
      Value<String> key,
      Value<bool> isPrivate,
      Value<int> length,
      Value<String> name}) {
    return PgpKeyCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      key: key ?? this.key,
      isPrivate: isPrivate ?? this.isPrivate,
      length: length ?? this.length,
      name: name ?? this.name,
    );
  }
}

class $PgpKeyTable extends PgpKey with TableInfo<$PgpKeyTable, LocalPgpKey> {
  final GeneratedDatabase _db;
  final String _alias;
  $PgpKeyTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      false,
    );
  }

  final VerificationMeta _keyMeta = const VerificationMeta('key');
  GeneratedTextColumn _key;
  @override
  GeneratedTextColumn get key => _key ??= _constructKey();
  GeneratedTextColumn _constructKey() {
    return GeneratedTextColumn(
      'key',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isPrivateMeta = const VerificationMeta('isPrivate');
  GeneratedBoolColumn _isPrivate;
  @override
  GeneratedBoolColumn get isPrivate => _isPrivate ??= _constructIsPrivate();
  GeneratedBoolColumn _constructIsPrivate() {
    return GeneratedBoolColumn(
      'is_private',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lengthMeta = const VerificationMeta('length');
  GeneratedIntColumn _length;
  @override
  GeneratedIntColumn get length => _length ??= _constructLength();
  GeneratedIntColumn _constructLength() {
    return GeneratedIntColumn(
      'length',
      $tableName,
      true,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, email, key, isPrivate, length, name];
  @override
  $PgpKeyTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'pgp_key';
  @override
  final String actualTableName = 'pgp_key';
  @override
  VerificationContext validateIntegrity(PgpKeyCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.email.present) {
      context.handle(
          _emailMeta, email.isAcceptableValue(d.email.value, _emailMeta));
    } else if (email.isRequired && isInserting) {
      context.missing(_emailMeta);
    }
    if (d.key.present) {
      context.handle(_keyMeta, key.isAcceptableValue(d.key.value, _keyMeta));
    } else if (key.isRequired && isInserting) {
      context.missing(_keyMeta);
    }
    if (d.isPrivate.present) {
      context.handle(_isPrivateMeta,
          isPrivate.isAcceptableValue(d.isPrivate.value, _isPrivateMeta));
    } else if (isPrivate.isRequired && isInserting) {
      context.missing(_isPrivateMeta);
    }
    if (d.length.present) {
      context.handle(
          _lengthMeta, length.isAcceptableValue(d.length.value, _lengthMeta));
    } else if (length.isRequired && isInserting) {
      context.missing(_lengthMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalPgpKey map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return LocalPgpKey.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(PgpKeyCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.email.present) {
      map['email'] = Variable<String, StringType>(d.email.value);
    }
    if (d.key.present) {
      map['key'] = Variable<String, StringType>(d.key.value);
    }
    if (d.isPrivate.present) {
      map['is_private'] = Variable<bool, BoolType>(d.isPrivate.value);
    }
    if (d.length.present) {
      map['length'] = Variable<int, IntType>(d.length.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    return map;
  }

  @override
  $PgpKeyTable createAlias(String alias) {
    return $PgpKeyTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $FilesTable _files;
  $FilesTable get files => _files ??= $FilesTable(this);
  $PgpKeyTable _pgpKey;
  $PgpKeyTable get pgpKey => _pgpKey ??= $PgpKeyTable(this);
  @override
  List<TableInfo> get allTables => [files, pgpKey];
}
