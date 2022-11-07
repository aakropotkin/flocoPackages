{

  inputs.packument.url   = "https://registry.npmjs.org/parse5?rev=133-b83bb152fc6f9683f7b5282f59fab8f6";
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
    ident = "parse5";
    ldir  = "info/unscoped/p/parse5";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
