let

  baseUrl = "https://api.npmjs.org/versions";

  urlFor = ident: let
    esc = builtins.replaceStrings ["/"] ["%2f"] ident;
  in "${baseUrl}/${esc}/last-week";

  weeklyDlCount' = ident: let
    raw = builtins.fetchTree { type = "file"; url = urlFor ident; };
  in builtins.fromJSON ( builtins.readFile raw );

  weeklyDlCount = x: let
    args = if builtins.isString x then x else x.ident or x.name;
  in weeklyDlCount' args;

in weeklyDlCount
