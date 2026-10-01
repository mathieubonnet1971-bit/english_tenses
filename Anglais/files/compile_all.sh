for f in *.tex; do
    echo
    echo "===== $f ====="

    if xelatex -interaction=nonstopmode -halt-on-error "$f" > /tmp/latex.log 2>&1 &&
       xelatex -interaction=nonstopmode -halt-on-error "$f" >> /tmp/latex.log 2>&1
    then
        echo "✓ OK"
    else
        echo "✗ ERREUR"
        tail -30 /tmp/latex.log
    fi
done
