{

  inputs.packument.url   = "https://registry.npmjs.org/fresh?rev=47-382a8837bc1766baf3b7ae7247710822";
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
    ident = "fresh";
    ldir  = "info/unscoped/f/fresh";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
