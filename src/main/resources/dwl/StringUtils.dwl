
/**
 * Sanitiza un texto aplicando las transformaciones indicadas en el objeto options.
 *
 * @param text    - El texto de entrada a sanitizar
 * @param options - Objeto de configuración con las siguientes propiedades:
 *                    - trimSpaces         (Boolean) Elimina espacios al inicio y al final
 *                    - removeSpecialChars (Boolean) Elimina caracteres especiales, deja solo alfanuméricos
 *                    - toLowerCase        (Boolean) Convierte el texto a minúsculas
 *
 * @return String con el texto sanitizado
 *
 * @example
 *   sanitizeString("  Hola MUNDO!! ", {trimSpaces: true, toLowerCase: true})
 *   // → "hola mundo!!"
 */
fun sanitizeString(text: String, options: Object) : String = do {
    var transformations = [
        {apply: options["trimSpaces"]         default false, fn: (t) -> trim(t)},
        {apply: options["removeSpecialChars"] default false, fn: (t) -> replace(t, /[^a-zA-Z0-9\s]/, "")},
        {apply: options["toLowerCase"] default false, fn: (t) -> lower(t)
      
    ]
    ---
    transformations reduce ((transform, acc = text) ->
        if (transform.apply) transform.fn(acc) else acc
    )
}