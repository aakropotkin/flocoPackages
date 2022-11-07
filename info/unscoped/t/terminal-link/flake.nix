{

  inputs.packument.url   = "https://registry.npmjs.org/terminal-link?rev=9-22aac6bca4489c7295ae45f07bf986cc";
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
    ident = "terminal-link";
    ldir  = "info/unscoped/t/terminal-link";
    inherit packument fetchInfo;
  } // latest';

}
