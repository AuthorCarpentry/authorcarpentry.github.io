#!/bin/bash

function checkApp() {
    APP_NAME=$1
    if [ "$APP_NAME" = "" ]; then
        echo "Missing $APP_NAME"
        exit 1
    fi
}

function softwareCheck() {
    for APP_NAME in $@; do
        checkApp $APP_NAME
    done
}

function mkPage () {
    nav="$1"
    content="$2"
    html="$3"

    echo "Rendering $html"
    mkpage \
        "nav=$nav" \
        "content=$content" \
        page.tmpl > $html
}

function mkSite() {
    FOLDER=$1

    echo "Generating HTML content for $FOLDER"
    find . -type f | grep -v .git | grep -E ".md$" | while read ITEM; do
        FNAME=$(basename "$ITEM")
        FOLDER=$(dirname "$ITEM")
        if [ -f "$FOLDER/$FNAME" ] && [ "$FNAME" != "nav.md" ]; then
            EXT=${FNAME:(-3)}
            if [ "$EXT" = ".md" ]; then
                HTML_FNAME=$(basename $FNAME .md).html
                if [ "$HTML_FNAME" = "README.html" ]; then
                    HTML_FNAME=index.html
                fi
                # Prefer the local directory's nav.md to the root level one.
                if [ -f "$FOLDER/nav.md" ]; then
                    mkPage "$FOLDER/nav.md" "$FOLDER/$FNAME" "$FOLDER/$HTML_FNAME"
                else
                    mkPage "nav.md" "$FOLDER/$FNAME" "$FOLDER/$HTML_FNAME"
                fi
                git add "$FOLDER/$FNAME" "$FOLDER/$HTML_FNAME"
            fi
        fi
    done
}

echo "Checking necessary software is installed"
softwareCheck mkpage
echo "Generating website"
mkSite "."


