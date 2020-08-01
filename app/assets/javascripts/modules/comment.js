$(function(){
  function leftHTML(comment){
    if ( comment.supporter_id ==  comment.current_supporter_id ) {
      if ( comment.content &&  comment.image ) {
        let html =
          `<div class="Comment Current" data-comment-id=${comment.comment_id}>
            <div class="Comment__body">
              <div class="Comment__date">
                ${comment.created_at}
              </div>
              <div class="Comment__text">
                <img class="Comment__image" src="${comment.image}">
              </div>
            </div>
          </div>
          <div class="Comment Current" data-comment-id=${comment.comment_id}>
            <div class="Comment__body">
              <div class="Comment__date">
                ${comment.created_at}
              </div>
              <div class="Comment__text">
                <p class="comment__content">
                  ${comment.content}
                </p>
              </div>
            </div>
          </div>`
        return html;
      } else if (comment.content) {
        let html =
          `<div class="Comment Current" data-comment-id=${comment.comment_id}>
            <div class="Comment__body">
              <div class="Comment__date">
                ${comment.created_at}
              </div>
              <div class="Comment__text">
                <p class="comment__content">
                  ${comment.content}
                </p>
              </div>
            </div>
          </div>`
        return html;
      } else {
        let html =
          `<div class="Comment Current" data-comment-id=${comment.comment_id}>
            <div class="Comment__body">
              <div class="Comment__date">
                ${comment.created_at}
              </div>
              <div class="Comment__text">
                <img class="Comment__image" src="${comment.image}">
              </div>
            </div>
          </div>`
        return html;
      }
    } else {
      if ( comment.content &&  comment.image ) {
        let html =
          `<div class=".Comment Other" data-comment-id=${comment.comment_id}>
            <div class="Comment__supporterName">
              ${comment.supporter_name}
            </div>
            <div class="Comment__body">
              <div class="Comment__text">
                <img class="Comment__image" src="${comment.image}">
              </div>
              <div class="Comment__date">
                ${comment.created_at}
              </div>
            </div>
          </div>
          <div class="Comment Other" data-comment-id=${comment.comment_id}>
            <div class="Comment__supporterName">
              ${comment.supporter_name}
            </div>
            <div class="Comment__body">
              <div class="Comment__text">
                <p class="comment__content">
                  ${comment.content}
                </p>
              </div>
              <div class="Comment__date">
                ${comment.created_at}
              </div>
            </div>
          </div>`
        return html;
      } else if (comment.content) {
        let html =
          `<div class="Comment Other" data-comment-id=${comment.comment_id}>
            <div class="Comment__supporterName">
              ${comment.supporter_name}
            </div>
            <div class="Comment__body">
              <div class="Comment__text">
                <p class="comment__content">
                  ${comment.content}
                </p>
              </div>
              <div class="Comment__date">
                ${comment.created_at}
              </div>
            </div>
          </div>`
        return html;
      } else {
        let html =
          `<div class=".Comment Other" data-comment-id=${comment.comment_id}>
            <div class="Comment__supporterName">
              ${comment.supporter_name}
            </div>
            <div class="Comment__body">
              <div class="Comment__text">
                <img class="Comment__image" src="${comment.image}">
              </div>
              <div class="Comment__date">
                ${comment.created_at}
              </div>
            </div>
          </div>`
        return html;
      }
    }
  }

  function rightHTML(comment){
    if ( comment.comment_id % 20 == 1 ) {
      let html =
        `<p class="Animation__pattern--1">
          ${comment.content}
        </p>`
      return html;
    } else if ( comment.comment_id % 20 == 2 ) {
      let html =
        `<p class="Animation__pattern--2">
          ${comment.content}
        </p>`
      return html;
    } else if ( comment.comment_id % 20 == 3 ) {
      let html =
        `<p class="Animation__pattern--3">
          ${comment.content}
        </p>`
      return html;
    } else if ( comment.comment_id % 20 == 4 ) {
      let html =
        `<p class="Animation__pattern--4">
          ${comment.content}
        </p>`
      return html;
    } else if ( comment.comment_id % 20 == 5 ) {
      let html =
        `<p class="Animation__pattern--5">
          ${comment.content}
        </p>`
      return html;
    } else if ( comment.comment_id % 20 == 6 ) {
      let html =
        `<p class="Animation__pattern--6">
          ${comment.content}
        </p>`
      return html;
    } else if ( comment.comment_id % 20 == 7 ) {
      let html =
        `<p class="Animation__pattern--7">
          ${comment.content}
        </p>`
      return html;
    } else if ( comment.comment_id % 20 == 8 ) {
      let html =
        `<p class="Animation__pattern--8">
          ${comment.content}
        </p>`
      return html;
    } else if ( comment.comment_id % 20 == 9 ) {
      let html =
        `<p class="Animation__pattern--9">
          ${comment.content}
        </p>`
      return html;
    } else if ( comment.comment_id % 20 == 10 ) {
      let html =
        `<p class="Animation__pattern--10">
          ${comment.content}
        </p>`
      return html;
    } else if ( comment.comment_id % 20 == 11 ) {
      let html =
        `<p class="Animation__pattern--11">
          ${comment.content}
        </p>`
      return html;
    } else if ( comment.comment_id % 20 == 12 ) {
      let html =
        `<p class="Animation__pattern--12">
          ${comment.content}
        </p>`
      return html;
    } else if ( comment.comment_id % 20 == 13 ) {
      let html =
        `<p class="Animation__pattern--13">
          ${comment.content}
        </p>`
      return html;
    } else if ( comment.comment_id % 20 == 14 ) {
      let html =
        `<p class="Animation__pattern--14">
          ${comment.content}
        </p>`
      return html;
    } else if ( comment.comment_id % 20 == 15 ) {
      let html =
        `<p class="Animation__pattern--15">
          ${comment.content}
        </p>`
      return html;
    } else if ( comment.comment_id % 20 == 16 ) {
      let html =
        `<p class="Animation__pattern--16">
          ${comment.content}
        </p>`
      return html;
    } else if ( comment.comment_id % 20 == 17 ) {
      let html =
        `<p class="Animation__pattern--17">
          ${comment.content}
        </p>`
      return html;
    } else if ( comment.comment_id % 20 == 18 ) {
      let html =
        `<p class="Animation__pattern--18">
          ${comment.content}
        </p>`
      return html;
    } else if ( comment.comment_id % 20 == 19 ) {
      let html =
        `<p class="Animation__pattern--19">
          ${comment.content}
        </p>`
      return html;
    } else {
      let html =
        `<p class="Animation__pattern--20">
          ${comment.content}
        </p>`
      return html;
    }
  }

  $(".CommentForm__formWith").on("submit", function(e){
    e.preventDefault()
    let formData = new FormData(this);
    let url = $(this).attr("action")
    $.ajax({
      url: url,
      type: "POST",
      data: formData,  
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(comment){
      let lefthtml = leftHTML(comment);
      let righthtml = rightHTML(comment);
      $(".CommentBody").append(lefthtml);
      $(".Animation__pattern").append(righthtml);
      $(".CommentBody").animate({ scrollTop: $(".CommentBody")[0].scrollHeight});
      $("form")[0].reset();
      $(".SendButton").prop("disabled", false);
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
    });
  });
});