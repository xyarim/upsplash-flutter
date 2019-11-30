import 'package:dio/dio.dart';
import 'package:upsplash_app/models/PhotoListResponse.dart';

String mock = """
[
    {
        "id": "_1aZEI41ofk",
        "created_at": "2019-07-11T19:14:12-04:00",
        "updated_at": "2019-11-28T00:04:18-05:00",
        "promoted_at": null,
        "width": 7680,
        "height": 4324,
        "color": "#5B4334",
        "description": null,
        "alt_description": "bottles on white and brown wall shelf",
        "urls": {
            "raw": "https://images.unsplash.com/photo-1562886812-41775a01195d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "full": "https://images.unsplash.com/photo-1562886812-41775a01195d?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "regular": "https://images.unsplash.com/photo-1562886812-41775a01195d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "small": "https://images.unsplash.com/photo-1562886812-41775a01195d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "thumb": "https://images.unsplash.com/photo-1562886812-41775a01195d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0"
        },
        "links": {
            "self": "https://api.unsplash.com/photos/_1aZEI41ofk",
            "html": "https://unsplash.com/photos/_1aZEI41ofk",
            "download": "https://unsplash.com/photos/_1aZEI41ofk/download",
            "download_location": "https://api.unsplash.com/photos/_1aZEI41ofk/download"
        },
        "categories": [],
        "likes": 192,
        "liked_by_user": false,
        "current_user_collections": [],
        "user": {
            "id": "o9M2-GtNlBE",
            "updated_at": "2019-11-28T23:27:27-05:00",
            "username": "honest",
            "name": "The Honest Company",
            "first_name": "The Honest Company",
            "last_name": "",
            "twitter_username": "honest",
            "portfolio_url": "https://www.honest.com/",
            "bio": "Our mission is to empower people to live healthy, happy lives. We're committed to creating effective, safe, delightful, accessible, responsible products.",
            "location": null,
            "links": {
                "self": "https://api.unsplash.com/users/honest",
                "html": "https://unsplash.com/@honest",
                "photos": "https://api.unsplash.com/users/honest/photos",
                "likes": "https://api.unsplash.com/users/honest/likes",
                "portfolio": "https://api.unsplash.com/users/honest/portfolio",
                "following": "https://api.unsplash.com/users/honest/following",
                "followers": "https://api.unsplash.com/users/honest/followers"
            },
            "profile_image": {
                "small": "https://images.unsplash.com/profile-1562879881254-56eb37673331?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                "medium": "https://images.unsplash.com/profile-1562879881254-56eb37673331?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                "large": "https://images.unsplash.com/profile-1562879881254-56eb37673331?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
            },
            "instagram_username": "honest",
            "total_collections": 0,
            "total_likes": 0,
            "total_photos": 65,
            "accepted_tos": true
        },
        "sponsorship": {
            "impression_urls": [
                "https://secure.insightexpressai.com/adServer/adServerESI.aspx?script=false&bannerID=5209899&rnd=unsplash&redir=https://secure.insightexpressai.com/adserver/1pixel.gif"
            ],
            "impressions_id": "5209899",
            "tagline": "Clean beauty that works.",
            "sponsor": {
                "id": "o9M2-GtNlBE",
                "updated_at": "2019-11-28T23:27:27-05:00",
                "username": "honest",
                "name": "The Honest Company",
                "first_name": "The Honest Company",
                "last_name": "",
                "twitter_username": "honest",
                "portfolio_url": "https://www.honest.com/",
                "bio": "Our mission is to empower people to live healthy, happy lives. We're committed to creating effective, safe, delightful, accessible, responsible products.",
                "location": null,
                "links": {
                    "self": "https://api.unsplash.com/users/honest",
                    "html": "https://unsplash.com/@honest",
                    "photos": "https://api.unsplash.com/users/honest/photos",
                    "likes": "https://api.unsplash.com/users/honest/likes",
                    "portfolio": "https://api.unsplash.com/users/honest/portfolio",
                    "following": "https://api.unsplash.com/users/honest/following",
                    "followers": "https://api.unsplash.com/users/honest/followers"
                },
                "profile_image": {
                    "small": "https://images.unsplash.com/profile-1562879881254-56eb37673331?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                    "medium": "https://images.unsplash.com/profile-1562879881254-56eb37673331?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                    "large": "https://images.unsplash.com/profile-1562879881254-56eb37673331?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
                },
                "instagram_username": "honest",
                "total_collections": 0,
                "total_likes": 0,
                "total_photos": 65,
                "accepted_tos": true
            }
        }
    },
    {
        "id": "HFhZmexpC3I",
        "created_at": "2019-11-28T04:52:11-05:00",
        "updated_at": "2019-11-28T18:15:14-05:00",
        "promoted_at": "2019-11-28T09:32:58-05:00",
        "width": 4480,
        "height": 6720,
        "color": "#110E0D",
        "description": null,
        "alt_description": null,
        "urls": {
            "raw": "https://images.unsplash.com/photo-1574934541365-9c12e657bea3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "full": "https://images.unsplash.com/photo-1574934541365-9c12e657bea3?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "regular": "https://images.unsplash.com/photo-1574934541365-9c12e657bea3?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "small": "https://images.unsplash.com/photo-1574934541365-9c12e657bea3?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "thumb": "https://images.unsplash.com/photo-1574934541365-9c12e657bea3?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0"
        },
        "links": {
            "self": "https://api.unsplash.com/photos/HFhZmexpC3I",
            "html": "https://unsplash.com/photos/HFhZmexpC3I",
            "download": "https://unsplash.com/photos/HFhZmexpC3I/download",
            "download_location": "https://api.unsplash.com/photos/HFhZmexpC3I/download"
        },
        "categories": [],
        "likes": 93,
        "liked_by_user": false,
        "current_user_collections": [],
        "user": {
            "id": "e5ZbUzGYzWY",
            "updated_at": "2019-11-29T03:09:27-05:00",
            "username": "darklabsindia",
            "name": "Dark Labs",
            "first_name": "Dark",
            "last_name": "Labs",
            "twitter_username": null,
            "portfolio_url": null,
            "bio": null,
            "location": "New Delhi, India",
            "links": {
                "self": "https://api.unsplash.com/users/darklabsindia",
                "html": "https://unsplash.com/@darklabsindia",
                "photos": "https://api.unsplash.com/users/darklabsindia/photos",
                "likes": "https://api.unsplash.com/users/darklabsindia/likes",
                "portfolio": "https://api.unsplash.com/users/darklabsindia/portfolio",
                "following": "https://api.unsplash.com/users/darklabsindia/following",
                "followers": "https://api.unsplash.com/users/darklabsindia/followers"
            },
            "profile_image": {
                "small": "https://images.unsplash.com/profile-1571910624707-704bf76a5cf9image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                "medium": "https://images.unsplash.com/profile-1571910624707-704bf76a5cf9image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                "large": "https://images.unsplash.com/profile-1571910624707-704bf76a5cf9image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
            },
            "instagram_username": "darklabsindia",
            "total_collections": 0,
            "total_likes": 0,
            "total_photos": 15,
            "accepted_tos": true
        }
    },
    {
        "id": "qtWuoSCYRxY",
        "created_at": "2019-11-28T08:06:17-05:00",
        "updated_at": "2019-11-28T18:06:50-05:00",
        "promoted_at": "2019-11-28T09:32:20-05:00",
        "width": 3648,
        "height": 5472,
        "color": "#E6E2DA",
        "description": null,
        "alt_description": "white candle",
        "urls": {
            "raw": "https://images.unsplash.com/photo-1574946349639-30f1d3a023aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "full": "https://images.unsplash.com/photo-1574946349639-30f1d3a023aa?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "regular": "https://images.unsplash.com/photo-1574946349639-30f1d3a023aa?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "small": "https://images.unsplash.com/photo-1574946349639-30f1d3a023aa?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "thumb": "https://images.unsplash.com/photo-1574946349639-30f1d3a023aa?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0"
        },
        "links": {
            "self": "https://api.unsplash.com/photos/qtWuoSCYRxY",
            "html": "https://unsplash.com/photos/qtWuoSCYRxY",
            "download": "https://unsplash.com/photos/qtWuoSCYRxY/download",
            "download_location": "https://api.unsplash.com/photos/qtWuoSCYRxY/download"
        },
        "categories": [],
        "likes": 119,
        "liked_by_user": false,
        "current_user_collections": [],
        "user": {
            "id": "NbQuexWWRhQ",
            "updated_at": "2019-11-28T23:13:33-05:00",
            "username": "ellienelie",
            "name": "Ellieelien",
            "first_name": "Ellieelien",
            "last_name": "",
            "twitter_username": null,
            "portfolio_url": "http://ellieelien.com/",
            "bio": "Feel free to reach out - Let's work together! I'm a Stylist + Product Photographer based in Stockholm, Sweden",
            "location": "Stockholm, Sweden",
            "links": {
                "self": "https://api.unsplash.com/users/ellienelie",
                "html": "https://unsplash.com/@ellienelie",
                "photos": "https://api.unsplash.com/users/ellienelie/photos",
                "likes": "https://api.unsplash.com/users/ellienelie/likes",
                "portfolio": "https://api.unsplash.com/users/ellienelie/portfolio",
                "following": "https://api.unsplash.com/users/ellienelie/following",
                "followers": "https://api.unsplash.com/users/ellienelie/followers"
            },
            "profile_image": {
                "small": "https://images.unsplash.com/profile-fb-1545950294-451b14de3f7a.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                "medium": "https://images.unsplash.com/profile-fb-1545950294-451b14de3f7a.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                "large": "https://images.unsplash.com/profile-fb-1545950294-451b14de3f7a.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
            },
            "instagram_username": "ellieelien",
            "total_collections": 1,
            "total_likes": 60,
            "total_photos": 129,
            "accepted_tos": true
        }
    },
    {
        "id": "auNG5QHryoQ",
        "created_at": "2019-11-28T09:29:03-05:00",
        "updated_at": "2019-11-28T14:25:26-05:00",
        "promoted_at": "2019-11-28T09:32:07-05:00",
        "width": 3840,
        "height": 5760,
        "color": "#2B3C4A",
        "description": null,
        "alt_description": "icy mountain scenery",
        "urls": {
            "raw": "https://images.unsplash.com/photo-1574951328073-832459a31291?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "full": "https://images.unsplash.com/photo-1574951328073-832459a31291?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "regular": "https://images.unsplash.com/photo-1574951328073-832459a31291?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "small": "https://images.unsplash.com/photo-1574951328073-832459a31291?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "thumb": "https://images.unsplash.com/photo-1574951328073-832459a31291?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0"
        },
        "links": {
            "self": "https://api.unsplash.com/photos/auNG5QHryoQ",
            "html": "https://unsplash.com/photos/auNG5QHryoQ",
            "download": "https://unsplash.com/photos/auNG5QHryoQ/download",
            "download_location": "https://api.unsplash.com/photos/auNG5QHryoQ/download"
        },
        "categories": [],
        "likes": 106,
        "liked_by_user": false,
        "current_user_collections": [],
        "user": {
            "id": "XZDJrfKzdWY",
            "updated_at": "2019-11-28T20:24:08-05:00",
            "username": "eberhardgross",
            "name": "eberhard grossgasteiger",
            "first_name": "eberhard",
            "last_name": "grossgasteiger",
            "twitter_username": "eberhardgross",
            "portfolio_url": "http://instagram.com/eberhard_grossgasteiger",
            "bio": "Simplicity is essential photography. \r\nI think the pursuit of perfected simplicity is the key to good photography!                              \r\n\r\n\r\n\r\n\r\n",
            "location": "Ahrntal, South Tyrol, Italy",
            "links": {
                "self": "https://api.unsplash.com/users/eberhardgross",
                "html": "https://unsplash.com/@eberhardgross",
                "photos": "https://api.unsplash.com/users/eberhardgross/photos",
                "likes": "https://api.unsplash.com/users/eberhardgross/likes",
                "portfolio": "https://api.unsplash.com/users/eberhardgross/portfolio",
                "following": "https://api.unsplash.com/users/eberhardgross/following",
                "followers": "https://api.unsplash.com/users/eberhardgross/followers"
            },
            "profile_image": {
                "small": "https://images.unsplash.com/profile-1536052438125-133137ad2359?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                "medium": "https://images.unsplash.com/profile-1536052438125-133137ad2359?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                "large": "https://images.unsplash.com/profile-1536052438125-133137ad2359?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
            },
            "instagram_username": "eberhard_grossgasteiger",
            "total_collections": 5,
            "total_likes": 2919,
            "total_photos": 1081,
            "accepted_tos": true
        }
    },
    {
        "id": "NY_vhtoY76o",
        "created_at": "2019-11-27T17:11:15-05:00",
        "updated_at": "2019-11-28T18:44:57-05:00",
        "promoted_at": "2019-11-28T09:31:49-05:00",
        "width": 4160,
        "height": 6240,
        "color": "#050009",
        "description": null,
        "alt_description": null,
        "urls": {
            "raw": "https://images.unsplash.com/photo-1574892627801-de77f82b5a6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "full": "https://images.unsplash.com/photo-1574892627801-de77f82b5a6d?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "regular": "https://images.unsplash.com/photo-1574892627801-de77f82b5a6d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "small": "https://images.unsplash.com/photo-1574892627801-de77f82b5a6d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "thumb": "https://images.unsplash.com/photo-1574892627801-de77f82b5a6d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0"
        },
        "links": {
            "self": "https://api.unsplash.com/photos/NY_vhtoY76o",
            "html": "https://unsplash.com/photos/NY_vhtoY76o",
            "download": "https://unsplash.com/photos/NY_vhtoY76o/download",
            "download_location": "https://api.unsplash.com/photos/NY_vhtoY76o/download"
        },
        "categories": [],
        "likes": 34,
        "liked_by_user": false,
        "current_user_collections": [],
        "user": {
            "id": "1Ii2-3J-e_o",
            "updated_at": "2019-11-29T03:16:34-05:00",
            "username": "jakobowens1",
            "name": "Jakob Owens",
            "first_name": "Jakob",
            "last_name": "Owens",
            "twitter_username": "jakobOwenss",
            "portfolio_url": "http://www.directorjakobowens.com",
            "bio": "Filmmaker and Photographer: LA/PHX - Instagram: @JakobOwens\r\nLightroom Presets available here: http://bit.ly/2nzXy7z",
            "location": null,
            "links": {
                "self": "https://api.unsplash.com/users/jakobowens1",
                "html": "https://unsplash.com/@jakobowens1",
                "photos": "https://api.unsplash.com/users/jakobowens1/photos",
                "likes": "https://api.unsplash.com/users/jakobowens1/likes",
                "portfolio": "https://api.unsplash.com/users/jakobowens1/portfolio",
                "following": "https://api.unsplash.com/users/jakobowens1/following",
                "followers": "https://api.unsplash.com/users/jakobowens1/followers"
            },
            "profile_image": {
                "small": "https://images.unsplash.com/profile-1489915140304-be21c5eb4986?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                "medium": "https://images.unsplash.com/profile-1489915140304-be21c5eb4986?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                "large": "https://images.unsplash.com/profile-1489915140304-be21c5eb4986?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
            },
            "instagram_username": "jakobowens",
            "total_collections": 2,
            "total_likes": 443,
            "total_photos": 672,
            "accepted_tos": true
        }
    },
    {
        "id": "V_QL02WVjdg",
        "created_at": "2019-11-27T15:19:20-05:00",
        "updated_at": "2019-11-28T18:54:49-05:00",
        "promoted_at": "2019-11-28T09:31:37-05:00",
        "width": 3963,
        "height": 3963,
        "color": "#E5E0E0",
        "description": "Book of Genesis with gray ribbon bow and black gift wrapping paper roll",
        "alt_description": "Genesis book on black surface",
        "urls": {
            "raw": "https://images.unsplash.com/photo-1574885914529-e157b2664e4c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "full": "https://images.unsplash.com/photo-1574885914529-e157b2664e4c?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "regular": "https://images.unsplash.com/photo-1574885914529-e157b2664e4c?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "small": "https://images.unsplash.com/photo-1574885914529-e157b2664e4c?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "thumb": "https://images.unsplash.com/photo-1574885914529-e157b2664e4c?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0"
        },
        "links": {
            "self": "https://api.unsplash.com/photos/V_QL02WVjdg",
            "html": "https://unsplash.com/photos/V_QL02WVjdg",
            "download": "https://unsplash.com/photos/V_QL02WVjdg/download",
            "download_location": "https://api.unsplash.com/photos/V_QL02WVjdg/download"
        },
        "categories": [],
        "likes": 21,
        "liked_by_user": false,
        "current_user_collections": [],
        "user": {
            "id": "BzmLG3GZosk",
            "updated_at": "2019-11-28T11:40:16-05:00",
            "username": "alabaster_co",
            "name": "Alabaster Co",
            "first_name": "Alabaster",
            "last_name": "Co",
            "twitter_username": "Alabaster_Co",
            "portfolio_url": "http://www.alabasterco.com",
            "bio": "Alabaster is a faith-based brand creating thoughtful and inspirational products designed to benefit humanity.\r\n\r\nOur vision is to see all of humanity experience God as good and beautiful.",
            "location": "Los Angeles",
            "links": {
                "self": "https://api.unsplash.com/users/alabaster_co",
                "html": "https://unsplash.com/@alabaster_co",
                "photos": "https://api.unsplash.com/users/alabaster_co/photos",
                "likes": "https://api.unsplash.com/users/alabaster_co/likes",
                "portfolio": "https://api.unsplash.com/users/alabaster_co/portfolio",
                "following": "https://api.unsplash.com/users/alabaster_co/following",
                "followers": "https://api.unsplash.com/users/alabaster_co/followers"
            },
            "profile_image": {
                "small": "https://images.unsplash.com/profile-1571095110625-fb16ff6765bbimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                "medium": "https://images.unsplash.com/profile-1571095110625-fb16ff6765bbimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                "large": "https://images.unsplash.com/profile-1571095110625-fb16ff6765bbimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
            },
            "instagram_username": "alabaster_co",
            "total_collections": 0,
            "total_likes": 0,
            "total_photos": 52,
            "accepted_tos": true
        }
    },
    {
        "id": "nmhsxfLaBuY",
        "created_at": "2019-11-27T15:03:54-05:00",
        "updated_at": "2019-11-28T18:54:49-05:00",
        "promoted_at": "2019-11-28T09:31:32-05:00",
        "width": 4160,
        "height": 6240,
        "color": "#EDF1F4",
        "description": null,
        "alt_description": "black professional video camera on stand",
        "urls": {
            "raw": "https://images.unsplash.com/photo-1574882559683-c27d3f9ab471?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "full": "https://images.unsplash.com/photo-1574882559683-c27d3f9ab471?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "regular": "https://images.unsplash.com/photo-1574882559683-c27d3f9ab471?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "small": "https://images.unsplash.com/photo-1574882559683-c27d3f9ab471?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "thumb": "https://images.unsplash.com/photo-1574882559683-c27d3f9ab471?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0"
        },
        "links": {
            "self": "https://api.unsplash.com/photos/nmhsxfLaBuY",
            "html": "https://unsplash.com/photos/nmhsxfLaBuY",
            "download": "https://unsplash.com/photos/nmhsxfLaBuY/download",
            "download_location": "https://api.unsplash.com/photos/nmhsxfLaBuY/download"
        },
        "categories": [],
        "likes": 49,
        "liked_by_user": false,
        "current_user_collections": [],
        "user": {
            "id": "1Ii2-3J-e_o",
            "updated_at": "2019-11-29T03:16:34-05:00",
            "username": "jakobowens1",
            "name": "Jakob Owens",
            "first_name": "Jakob",
            "last_name": "Owens",
            "twitter_username": "jakobOwenss",
            "portfolio_url": "http://www.directorjakobowens.com",
            "bio": "Filmmaker and Photographer: LA/PHX - Instagram: @JakobOwens\r\nLightroom Presets available here: http://bit.ly/2nzXy7z",
            "location": null,
            "links": {
                "self": "https://api.unsplash.com/users/jakobowens1",
                "html": "https://unsplash.com/@jakobowens1",
                "photos": "https://api.unsplash.com/users/jakobowens1/photos",
                "likes": "https://api.unsplash.com/users/jakobowens1/likes",
                "portfolio": "https://api.unsplash.com/users/jakobowens1/portfolio",
                "following": "https://api.unsplash.com/users/jakobowens1/following",
                "followers": "https://api.unsplash.com/users/jakobowens1/followers"
            },
            "profile_image": {
                "small": "https://images.unsplash.com/profile-1489915140304-be21c5eb4986?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                "medium": "https://images.unsplash.com/profile-1489915140304-be21c5eb4986?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                "large": "https://images.unsplash.com/profile-1489915140304-be21c5eb4986?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
            },
            "instagram_username": "jakobowens",
            "total_collections": 2,
            "total_likes": 443,
            "total_photos": 672,
            "accepted_tos": true
        }
    },
    {
        "id": "knwQqt-cAe0",
        "created_at": "2019-11-27T16:28:42-05:00",
        "updated_at": "2019-11-28T14:03:29-05:00",
        "promoted_at": "2019-11-28T09:31:24-05:00",
        "width": 5304,
        "height": 7952,
        "color": "#FD9566",
        "description": null,
        "alt_description": "low angle view of moving train",
        "urls": {
            "raw": "https://images.unsplash.com/photo-1574887601943-3f15543a03d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "full": "https://images.unsplash.com/photo-1574887601943-3f15543a03d4?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "regular": "https://images.unsplash.com/photo-1574887601943-3f15543a03d4?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "small": "https://images.unsplash.com/photo-1574887601943-3f15543a03d4?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "thumb": "https://images.unsplash.com/photo-1574887601943-3f15543a03d4?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0"
        },
        "links": {
            "self": "https://api.unsplash.com/photos/knwQqt-cAe0",
            "html": "https://unsplash.com/photos/knwQqt-cAe0",
            "download": "https://unsplash.com/photos/knwQqt-cAe0/download",
            "download_location": "https://api.unsplash.com/photos/knwQqt-cAe0/download"
        },
        "categories": [],
        "likes": 60,
        "liked_by_user": false,
        "current_user_collections": [],
        "user": {
            "id": "jGcUilR-_jc",
            "updated_at": "2019-11-28T14:42:32-05:00",
            "username": "vincefleming",
            "name": "Vince Fleming",
            "first_name": "Vince",
            "last_name": "Fleming",
            "twitter_username": null,
            "portfolio_url": "http://vincefleming.com",
            "bio": "I just want You, nothing else will do.",
            "location": "Socal",
            "links": {
                "self": "https://api.unsplash.com/users/vincefleming",
                "html": "https://unsplash.com/@vincefleming",
                "photos": "https://api.unsplash.com/users/vincefleming/photos",
                "likes": "https://api.unsplash.com/users/vincefleming/likes",
                "portfolio": "https://api.unsplash.com/users/vincefleming/portfolio",
                "following": "https://api.unsplash.com/users/vincefleming/following",
                "followers": "https://api.unsplash.com/users/vincefleming/followers"
            },
            "profile_image": {
                "small": "https://images.unsplash.com/profile-fb-1513648871-b384f5e41430.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                "medium": "https://images.unsplash.com/profile-fb-1513648871-b384f5e41430.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                "large": "https://images.unsplash.com/profile-fb-1513648871-b384f5e41430.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
            },
            "instagram_username": "vince.fleming",
            "total_collections": 6,
            "total_likes": 2678,
            "total_photos": 107,
            "accepted_tos": true
        }
    },
    {
        "id": "cMJnZxg946M",
        "created_at": "2019-11-27T16:42:36-05:00",
        "updated_at": "2019-11-28T14:07:04-05:00",
        "promoted_at": "2019-11-28T09:31:17-05:00",
        "width": 5304,
        "height": 7952,
        "color": "#F1EEE7",
        "description": null,
        "alt_description": "vehicles crossing beside metal structures",
        "urls": {
            "raw": "https://images.unsplash.com/photo-1574890766637-4d914193edfe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "full": "https://images.unsplash.com/photo-1574890766637-4d914193edfe?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "regular": "https://images.unsplash.com/photo-1574890766637-4d914193edfe?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "small": "https://images.unsplash.com/photo-1574890766637-4d914193edfe?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "thumb": "https://images.unsplash.com/photo-1574890766637-4d914193edfe?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0"
        },
        "links": {
            "self": "https://api.unsplash.com/photos/cMJnZxg946M",
            "html": "https://unsplash.com/photos/cMJnZxg946M",
            "download": "https://unsplash.com/photos/cMJnZxg946M/download",
            "download_location": "https://api.unsplash.com/photos/cMJnZxg946M/download"
        },
        "categories": [],
        "likes": 40,
        "liked_by_user": false,
        "current_user_collections": [],
        "user": {
            "id": "jGcUilR-_jc",
            "updated_at": "2019-11-28T14:42:32-05:00",
            "username": "vincefleming",
            "name": "Vince Fleming",
            "first_name": "Vince",
            "last_name": "Fleming",
            "twitter_username": null,
            "portfolio_url": "http://vincefleming.com",
            "bio": "I just want You, nothing else will do.",
            "location": "Socal",
            "links": {
                "self": "https://api.unsplash.com/users/vincefleming",
                "html": "https://unsplash.com/@vincefleming",
                "photos": "https://api.unsplash.com/users/vincefleming/photos",
                "likes": "https://api.unsplash.com/users/vincefleming/likes",
                "portfolio": "https://api.unsplash.com/users/vincefleming/portfolio",
                "following": "https://api.unsplash.com/users/vincefleming/following",
                "followers": "https://api.unsplash.com/users/vincefleming/followers"
            },
            "profile_image": {
                "small": "https://images.unsplash.com/profile-fb-1513648871-b384f5e41430.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                "medium": "https://images.unsplash.com/profile-fb-1513648871-b384f5e41430.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                "large": "https://images.unsplash.com/profile-fb-1513648871-b384f5e41430.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
            },
            "instagram_username": "vince.fleming",
            "total_collections": 6,
            "total_likes": 2678,
            "total_photos": 107,
            "accepted_tos": true
        }
    },
    {
        "id": "YMYD17R80rA",
        "created_at": "2019-11-27T23:30:52-05:00",
        "updated_at": "2019-11-28T14:02:13-05:00",
        "promoted_at": "2019-11-28T09:31:11-05:00",
        "width": 4261,
        "height": 6392,
        "color": "#0D100D",
        "description": null,
        "alt_description": "coffee latte",
        "urls": {
            "raw": "https://images.unsplash.com/photo-1574914629377-e97c19438717?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "full": "https://images.unsplash.com/photo-1574914629377-e97c19438717?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "regular": "https://images.unsplash.com/photo-1574914629377-e97c19438717?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "small": "https://images.unsplash.com/photo-1574914629377-e97c19438717?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0",
            "thumb": "https://images.unsplash.com/photo-1574914629377-e97c19438717?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjEwMjM2NH0"
        },
        "links": {
            "self": "https://api.unsplash.com/photos/YMYD17R80rA",
            "html": "https://unsplash.com/photos/YMYD17R80rA",
            "download": "https://unsplash.com/photos/YMYD17R80rA/download",
            "download_location": "https://api.unsplash.com/photos/YMYD17R80rA/download"
        },
        "categories": [],
        "likes": 23,
        "liked_by_user": false,
        "current_user_collections": [],
        "user": {
            "id": "dG6lZyj-wvM",
            "updated_at": "2019-11-29T03:58:04-05:00",
            "username": "nate_dumlao",
            "name": "Nathan Dumlao",
            "first_name": "Nathan",
            "last_name": "Dumlao",
            "twitter_username": "Nate_Dumlao",
            "portfolio_url": "http://www.nathandumlaophotos.com",
            "bio": "Brand Consultant and Content Creator living in Los Angeles creating up the coast.",
            "location": "Los Angeles",
            "links": {
                "self": "https://api.unsplash.com/users/nate_dumlao",
                "html": "https://unsplash.com/@nate_dumlao",
                "photos": "https://api.unsplash.com/users/nate_dumlao/photos",
                "likes": "https://api.unsplash.com/users/nate_dumlao/likes",
                "portfolio": "https://api.unsplash.com/users/nate_dumlao/portfolio",
                "following": "https://api.unsplash.com/users/nate_dumlao/following",
                "followers": "https://api.unsplash.com/users/nate_dumlao/followers"
            },
            "profile_image": {
                "small": "https://images.unsplash.com/profile-1495427732560-fe5248ad6638?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                "medium": "https://images.unsplash.com/profile-1495427732560-fe5248ad6638?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                "large": "https://images.unsplash.com/profile-1495427732560-fe5248ad6638?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
            },
            "instagram_username": "nate_dumlao",
            "total_collections": 2,
            "total_likes": 1312,
            "total_photos": 1255,
            "accepted_tos": true
        }
    }
]
""";

abstract class PhotoRepository {
  Future<List<PhotoListBean>> getPhotos(int page);
}

class MainPhotoRepository implements PhotoRepository {
  @override
  Future<List<PhotoListBean>> getPhotos(int page) async {
    try {
      Response response = await Dio().get(
          "https://api.unsplash.com/photos/?client_id=e2658d4b6b17ae24b50a7ab36d13ca67da9761322a5e4cb0e9cc531e69cecb90&page=$page");

      List<PhotoListBean> list =
          PhotoListResponse.fromJsonArray(response.data).results;
      list.forEach((value){
        print(value.color);
      });
      print(list.length);
      return list;
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      return null;
    }
  }
}
