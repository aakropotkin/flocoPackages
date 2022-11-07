{

  inputs.packument.url   = "https://registry.npmjs.org/unist-builder?rev=18-3bbe784c33369f7a2a932d950c4c2294";
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
    ident = "unist-builder";
    ldir  = "info/unscoped/u/unist-builder";
    inherit packument fetchInfo;
  } // latest';

}
