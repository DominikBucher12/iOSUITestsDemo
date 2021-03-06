// Copyright since 2015 Showmax s.r.o.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import UIKit
import Nuke

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        avatar.contentMode = .scaleAspectFit
        isAccessibilityElement = true
    }

    func setup(with character: Movie) {
        name.text = character.title
        switch character.poster {
        case .image(let image):
            avatar.image = image
        case .url(let url):
            Nuke.loadImage(with: url, into: avatar)
        }
    }
}
