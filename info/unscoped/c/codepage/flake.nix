{

  inputs.packument.url   = "https://registry.npmjs.org/codepage?rev=102-18760d8619ad84069e8d2856aae5d06d";
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
    ident = "codepage";
    ldir  = "info/unscoped/c/codepage";
    inherit packument fetchInfo;
  } // latest';

}
