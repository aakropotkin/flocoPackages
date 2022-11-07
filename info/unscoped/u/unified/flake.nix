{

  inputs.packument.url   = "https://registry.npmjs.org/unified?rev=64-577528d6b8851f2970ae4751fd37f26f";
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
    ident = "unified";
    ldir  = "info/unscoped/u/unified";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
