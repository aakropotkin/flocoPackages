{

  inputs.packument.url   = "https://registry.npmjs.org/@types/html-minifier-terser?rev=254-481d4f99196294b508fc10deabc20325";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = "@types";
    ident = "@types/html-minifier-terser";
    ldir  = "info/types/html-minifier-terser";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
