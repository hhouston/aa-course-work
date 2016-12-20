class View {
  constructor(game, $el){
    this.game = game;
    this.$el = $el;
    this.fromTowerIdx = null;
    this.fromTower = null;


    this.$el.on (
      "click",
      "ul",
      this.clickTower.bind(this)
    );

    this.setUpTowers();
  }

  clickTower(event) {
    // console.log(event.currentTarget.pos);
    const $currentTarget = $(event.currentTarget);
    const clickedTowerIdx = $currentTarget.data("pos");

    if (this.fromTowerIdx === null) {
      this.fromTowerIdx = clickedTowerIdx;
      this.fromTower = $currentTarget;
    } else {
      if(!this.game.move(this.fromTowerIdx, clickedTowerIdx)) {
        alert('move error');
      }

      console.log(this.fromTower);
      this.fromTower.each((index, item) => {
        if ($(item).hasClass('disc')){
          console.log("hello");
          return;}
      });


      this.fromTowerIdx = null;
    }

  }

  setUpTowers(){
    this.$el.addClass('group');
    const $div = $("<div>");

    for (var i = 0; i < 3; i++) {
      const $ul = $("<ul>");
      $ul.data("pos", i);

      for (let discI = 1; discI < 4; discI++) {
        const $li = $("<li>");
          if (i === 0){
            $li.addClass(`disc${discI}`);
            $li.addClass(`disc`);
            $li.text(discI);
          }
        $ul.append($li);
      }

      $div.append($ul);
    }


    this.$el.append($div);
    // let firstTower = $('[data-pos=0]');

    // console.log(firstTower);
  }

  render() {
      /*
      Rather than removing all our elements from the page
      and building them up again, we are removing only the
      classes and re-adding them as necessary. This is a
      more light-weight approach and will speed up the
      redrawing in the browser.
      */
      const $towers = this.$el.find("ul");
      $towers.removeClass();

      if (this.fromTowerIdx !== null) {
        $towers.eq(this.fromTowerIdx).addClass("selected");
      }

      this.game.towers.forEach( (disks, towerIdx) => {
        const $disks = $towers.eq(towerIdx).children();
        $disks.removeClass();

        disks.forEach( (diskWidth, diskIdx) => {
          /*
          Since our disks are stacked from bottom to top
          as [3, 2, 1], we have to select from the back
          of our jQuery object, using negative indices.
          */
          $disks.eq(-1 * (diskIdx + 1)).addClass(`disk disk-${diskWidth}`);
        });
      });
    }

}




module.exports = View;
