// To parse this JSON data, do
//
//     final githubRepoCommit = githubRepoCommitFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<GithubRepoCommit> githubRepoCommitFromJson(String str) =>
    List<GithubRepoCommit>.from(
        json.decode(str).map((x) => GithubRepoCommit.fromJson(x)));

String githubRepoCommitToJson(List<GithubRepoCommit> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GithubRepoCommit {
  GithubRepoCommit({
    required this.url,
    required this.sha,
    required this.nodeId,
    required this.htmlUrl,
    required this.commentsUrl,
    required this.commit,
    required this.author,
    required this.committer,
    required this.parents,
  });

  String url;
  String sha;
  String nodeId;
  String htmlUrl;
  String commentsUrl;
  Commit commit;
  GithubRepoCommitAuthor author;
  GithubRepoCommitAuthor committer;
  List<Tree> parents;

  factory GithubRepoCommit.fromJson(Map<String, dynamic> json) =>
      GithubRepoCommit(
        url: json["url"],
        sha: json["sha"],
        nodeId: json["node_id"],
        htmlUrl: json["html_url"],
        commentsUrl: json["comments_url"],
        commit: Commit.fromJson(json["commit"]),
        author: GithubRepoCommitAuthor.fromJson(json["author"]),
        committer: GithubRepoCommitAuthor.fromJson(json["committer"]),
        parents: List<Tree>.from(json["parents"].map((x) => Tree.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "sha": sha,
        "node_id": nodeId,
        "html_url": htmlUrl,
        "comments_url": commentsUrl,
        "commit": commit.toJson(),
        "author": author.toJson(),
        "committer": committer.toJson(),
        "parents": List<dynamic>.from(parents.map((x) => x.toJson())),
      };
}

class GithubRepoCommitAuthor {
  GithubRepoCommitAuthor({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;

  factory GithubRepoCommitAuthor.fromJson(Map<String, dynamic> json) =>
      GithubRepoCommitAuthor(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: json["type"],
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "site_admin": siteAdmin,
      };
}

class Commit {
  Commit({
    required this.url,
    required this.author,
    required this.committer,
    required this.message,
    required this.tree,
    required this.commentCount,
    required this.verification,
  });

  String url;
  CommitAuthor author;
  CommitAuthor committer;
  String message;
  Tree tree;
  int commentCount;
  Verification verification;

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        url: json["url"],
        author: CommitAuthor.fromJson(json["author"]),
        committer: CommitAuthor.fromJson(json["committer"]),
        message: json["message"],
        tree: Tree.fromJson(json["tree"]),
        commentCount: json["comment_count"],
        verification: Verification.fromJson(json["verification"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "author": author.toJson(),
        "committer": committer.toJson(),
        "message": message,
        "tree": tree.toJson(),
        "comment_count": commentCount,
        "verification": verification.toJson(),
      };
}

class CommitAuthor {
  CommitAuthor({
    required this.name,
    required this.email,
    required this.date,
  });

  String name;
  String email;
  DateTime date;

  factory CommitAuthor.fromJson(Map<String, dynamic> json) => CommitAuthor(
        name: json["name"],
        email: json["email"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "date": date.toIso8601String(),
      };
}

class Tree {
  Tree({
    required this.url,
    required this.sha,
  });

  String url;
  String sha;

  factory Tree.fromJson(Map<String, dynamic> json) => Tree(
        url: json["url"],
        sha: json["sha"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "sha": sha,
      };
}

class Verification {
  Verification({
    required this.verified,
    required this.reason,
    required this.signature,
    required this.payload,
  });

  bool verified;
  String reason;
  dynamic signature;
  dynamic payload;

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        verified: json["verified"],
        reason: json["reason"],
        signature: json["signature"],
        payload: json["payload"],
      );

  Map<String, dynamic> toJson() => {
        "verified": verified,
        "reason": reason,
        "signature": signature,
        "payload": payload,
      };
}
