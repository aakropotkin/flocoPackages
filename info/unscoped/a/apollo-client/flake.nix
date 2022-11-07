{

  inputs.packument.url   = "https://registry.npmjs.org/apollo-client?rev=384-1619607143d2da5c92a4cf474c2a8867";
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
    ident = "apollo-client";
    ldir  = "info/unscoped/a/apollo-client";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
