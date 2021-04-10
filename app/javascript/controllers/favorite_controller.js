import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'notFav', 'faved' ];

  refresh() {
    const fav = this.favedTarget.hidden;
    this.favedTarget.hidden = !fav;
    this.notFavTarget.hidden = fav;
  }

}
