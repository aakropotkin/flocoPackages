{

  inputs.packument.url   = "https://registry.npmjs.org/escape-goat?rev=12-97b7ccc5c03851fd82f91fb8f65880ed";
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
    ident = "escape-goat";
    ldir  = "info/unscoped/e/escape-goat";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
