{

  inputs.packument.url   = "https://registry.npmjs.org/bootstrap?rev=499-af8f2fae1989a4f552e9d9c86dd3cbc8";
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
    ident = "bootstrap";
    ldir  = "info/unscoped/b/bootstrap";
    inherit packument fetchInfo;
  } // latest';

}
