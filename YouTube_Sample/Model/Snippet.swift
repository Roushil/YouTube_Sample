/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Snippet : Codable {
	let publishedAt : String?
	let channelId : String?
	let title : String?
	let description : String?
	let thumbnails : Thumbnails?
	let channelTitle : String?
	let playlistId : String?
	let position : Int?
	let resourceId : ResourceId?

	enum CodingKeys: String, CodingKey {

		case publishedAt = "publishedAt"
		case channelId = "channelId"
		case title = "title"
		case description = "description"
		case thumbnails = "thumbnails"
		case channelTitle = "channelTitle"
		case playlistId = "playlistId"
		case position = "position"
		case resourceId = "resourceId"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
		channelId = try values.decodeIfPresent(String.self, forKey: .channelId)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		thumbnails = try values.decodeIfPresent(Thumbnails.self, forKey: .thumbnails)
		channelTitle = try values.decodeIfPresent(String.self, forKey: .channelTitle)
		playlistId = try values.decodeIfPresent(String.self, forKey: .playlistId)
		position = try values.decodeIfPresent(Int.self, forKey: .position)
		resourceId = try values.decodeIfPresent(ResourceId.self, forKey: .resourceId)
	}

}
