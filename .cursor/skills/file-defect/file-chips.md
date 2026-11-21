# File chips in the screenshot cell

The cell address `C4` in the algorithm below is the `Скриншот / видео` cell of the new defect row. Use that cell's address. Do not change screenshot cells in rows that already exist.

The share links already have General access set to anyone with the link, as a viewer.

## Algorithm: several Google Drive files as smart chips in one Google Sheets cell

**Goal:** in one cell (for example, C4), get several Drive file smart chips, separated by spaces.

**Automation limits:**

- Do not click the sheet grid. Use only «Поле имени» and the keyboard.
- The clipboard is often unavailable, so type or insert the link with `insertText` or text input, not with Ctrl+V.
- A separate `Space` before the second link is often lost, so for the 2nd and later files insert **one string**: `" " + URL`.

**Preparation:** the spreadsheet tab and the Drive folder tab are open. The share links are known, in the form `https://drive.google.com/file/d/<ID>/view?usp=sharing` (without `@`).

### Cycle 1 — first file

1. Take the link to the first file (from Drive or from a known ID).
2. In the spreadsheet, click **«Поле имени»** (`aria-label` / the coordinate box), type the cell address (for example `C4`), and press **Enter**.
3. If the cell is not empty: **Backspace** (clear it), then **F2** (edit mode). If it is empty: **F2** immediately.
4. Type the URL **without `@`**, then press **Enter** (save and leave edit mode).
5. **«Поле имени»** again → `C4` → **Enter**.
6. **F2**, then **End** (the cursor is at the end; the «Заменить URL» card appears).
7. On the card, press the **«Чип»** button. A click by the button's coordinates is more reliable than a DOM `.click()`.
8. Check: the formula bar shows the file name (for example `2026-01-09.png`), not the full URL. Press **Enter**.

### Cycle 2 — second and later files (same cell)

1. Take the link to the next file.
2. **«Поле имени»** → `C4` → **Enter**. **Do not press Backspace.** Leave the first chip as it is.
3. **F2**, then **End** (the cursor is to the right of the chip already created).
4. Insert **in one operation** the text space + URL (`" https://drive.google.com/file/d/.../view?usp=sharing"`). Before Enter, check that the content has a space between the first chip's name and `https://` (for example by reading the editor value).
5. **Enter**.
6. **«Поле имени»** again → `C4` → **Enter**.
7. **F2**, **End**, wait for the «Заменить URL» card for the **new** link, and press **«Чип»**.
8. Repeat cycle 2 for the remaining files.

### Finish

1. Select the cell through **«Поле имени»**.
2. Confirm: the formula bar shows file names separated by spaces (`файл1.png файл2.jpg`), with no raw URLs.
3. Take a screenshot of the cell. If the second chip is not visible in the grid, the column is narrow. Success is the formula bar and the conversion into chips, not visibility inside a narrow cell.

### Do not

- `@URL` + Tab. It does not work in this scenario.
- Insert the second link flush against the first chip with no space. The chip breaks and the text sticks together.
- Rely on a separate `Space` before `browser_type` of the URL. The space often disappears. `" " + URL` is needed in one insertion (`insertText`).
- Treat Enter as entering edit mode. **F2** is required.
