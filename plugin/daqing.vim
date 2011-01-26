" =========================
" File: daqing.vim
" Description: small plugin to asistant my day-to-day development
" Maintainer: Kinch Zhang <kinch.zhang@gmail.com>
" License: The MIT License <http://www.opensource.org/licenses/mit-license.php>
" =========================
fun! Write(str)
    execute "normal I" . a:str . "\<Esc>"
endfun

fun! InsertImg(theme, low, high)
    let i = a:low
    while i < a:high
        call Write("<td><img src=\"./smiley/". a:theme ."/".i.".gif\" id=\"". a:theme ."_".i."\" /></td>\n")
        let i += 1
    endwhile
endfun

fun! GenCss(low, high)
    let i = a:low
    while i < a:high
        call Write("#smiley_default_". i . " { background-position: -" . ((i - 1) * 30) . "px 0; }\n")
        let i += 1
    endwhile
endfun

fun! InsertMenu(start, end)
    call Write("<ul>\n")
    let i = a:start
    while i <= a:end
        call Write("    <li>" . i . "</li>\n")
        let i += 1
    endwhile
    call Write("</ul>\n")
endfun

let s:published = 1
fun! Publish(dir, new_ext)
    let filename = GetFilename()
    let base = GetBase(Basename(filename))
    let new_name = base . "." . a:new_ext
    if s:published > 1
        exe "silent ! rm ~/Desktop/*." . a:new_ext
        exe "redraw!"
    endif
    exe "silent ! cp " . filename . " " . a:dir . s:published . "-". new_name
    exe "redraw!"
    let s:published += 1
endfun

fun! GetFilename()
   return expand("%")
endfun

fun! Basename(file)
    if stridx(a:file, "/") == -1
        return a:file
    else
        let segments = split(a:file, "/")
        if len(segments) > 1
            return segments[-1]
        else
            return ""
        endif
    endif
endfun

fun! GetExt(name)
    let segments = split(a:name, '\.')
    if len(segments) > 1
        return segments[1]
    else
        return ""
    endif
endfun

fun! GetBase(name)
    let segments = split(a:name, '\.')
    if len(segments) > 1
        return segments[0]
    else
        return ""
    endif
endfun

fun! Cp(dir)
    let filename = GetFilename()
    exe "! cp " . filename . " " . a:dir
    "exe "redraw!"
endfun

map <C-p> :call Publish("~/desktop/", "html")<CR>
