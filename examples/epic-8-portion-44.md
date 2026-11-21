# Epic 8, portion 44

One finished staging check, copied from the run. The portion is a short moderation pass: an author submits a word, a moderator acts on it, and a reader sees the result. The report is in English. Product labels, word names, and quoted interface text stay in the original language. Screenshots are omitted.

Items 12 and 13 were skipped. Item 14 was checked. The table below covers the whole list.

An account without the author role sent a direct `POST /api/v1/words/{id}/publication/submit` for its word **koira**. The response was **409**, code `publication_policy_required`: «Accept the current publication policy and platform rules». The word stayed personal, and no request was created.

| Item | Requirement | Observation | Status | Risk |
|---|---|---|---|---|
| 2 | Submit a word with a translation: «На проверке», a request appears in the queue, and the reader sees «не найдено». | Word qaep8sill is «На проверке» on the author's dashboard, and the request was in the queue. For the reader, collections show «Ничего не найдено» and words show «Слова не найдены». | met | |
| 3 | The moderator takes the request, sets 18+ to «нет», and approves: the word is «Опубликовано», the author gets a notification, and the word is in the feed and in search. | One request was approved, 18+ was «нет», and it left the queue. Badge «Опубликовано», notification «Публикация слова «qaep8sill» одобрена». The word is in guest search and first in «Новинках». | met | |
| 4 | The author unpublishes the word, then uses «Показать снова» with no edits: it is immediately «Опубликовано», and there is no new request. | After unpublishing, the badge is «Снято вручную». There is no «Показать снова» button. The dialog «Отправить на публикацию?» says a moderator will review the material. After confirmation it is immediately «Опубликовано», and there was no new request in the queue. | discrepancy | The author is told to expect a review, but the word is published immediately |
| 5 | The author unpublishes the word, changes the translation, and submits: a new request; the moderator rejects it with a reason; the author sees the reason and «Подать апелляцию». | The translation was changed to «проверка стенда два», status «На проверке». Rejection reason «неприемлимый контент». The window «Материал отклонён» shows that reason and the button «Подать апелляцию». | met | |
| 6 | Appeal: it is submitted, a second moderator reviews it, and the outcome arrives as a notification. | Appeal text «проверка апелляции стенда». The second moderator set upheld. A notification arrived with the outcome, status «Отклонено». | met | |
| 7 | A significant edit of a published word: a confirmation, and the word is «Снято». | The published word hyvä had its translation changed from «хороший» to «хороший стенд». There was no confirmation dialog. Badge «Снято вручную». | discrepancy | The edit unpublishes the word without confirmation, and the status is different |
| 8 | A collection of 3 published words: submit, approve, «Ждёт публикации слов»; approve the fourth word and the collection publishes itself. | After approval, qaep8coll showed «Ожидает публикации слов: 3/4». After the fourth word hyvä was approved, the collection became «Опубликовано». Notification «Одобрено 2 материала: hyvä, qaep8coll». | discrepancy | At the threshold the author sees a different status label |
| 9 | A bulk submit of 5 materials shows a result with counts. | qaep8m1–qaep8m5 were created through «Несколько слов». Message «В библиотеку добавлено 5 слов». All five are «На проверке» on the dashboard. | met | |
| 10 | A reader reports a word: the report reaches the moderator, then it is closed as no_action. | The reader reported hyvä, reason «Другое», comment «проверка жалобы стенда». Text «Жалоба отправлена модераторам». The report was closed as no_action, and the word stayed in search. | met | |
| 11 | A word with a blocking finding (18+ from the test set): a reject suggestion, and in mode A it is still in the queue. | Skipped: the word from the test list is not available. | not checked | |
| 12 | A test image from the test hash registry, with the hash flag on: a finding, and a neutral reason for the author. | Skipped: the test image is not available. | not checked | |
| 13 | A moderator who is also the author does not see their own material in the queue. | Skipped: there is no such account, and the moderation portal is unavailable. | not checked | |
| 14 | A user without the author role cannot submit. A direct request is rejected. | Word koira. The direct submit request was rejected: 409, publication_policy_required. No request was created, status personal. | met | |

| Change | Reverted |
|---|---|
| Word qaep8sill: created, published, translation «проверка стенда два», rejected, appeal upheld | no |
| Word hyvä: translation changed to «хороший стенд», then published again | no |
| Collection qaep8coll created and published | no |
| Words qaep8m1–qaep8m5 created, status «На проверке» | no |
| Report on hyvä, closed as no_action | no |

Guesses

- Notifications and the appeal-submit button say «Аппеляция», with a double «п». The button «Подать апелляцию» uses the ordinary spelling. This is not tied to a check row.
- The collection submit dialog shows the raw keys `collections.publication.*`. This is not tied to item 8.
- An account without the author role sees the block «Опубликовать слова?» on the library page. The direct request is still rejected. Item 14 does not require that button to be hidden.
