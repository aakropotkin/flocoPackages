{

  inputs.packument.url   = "https://registry.npmjs.org/http-parser-js?rev=47-b3687c1cff8b4332ca1832665845eb18";
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
    scope = null;
    ident = "http-parser-js";
    ldir  = "info/unscoped/h/http-parser-js";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
