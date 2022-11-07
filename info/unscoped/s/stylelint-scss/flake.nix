{

  inputs.packument.url   = "https://registry.npmjs.org/stylelint-scss?rev=100-f20678a2a937f8292efe88b716fa353c";
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
    ident = "stylelint-scss";
    ldir  = "info/unscoped/s/stylelint-scss";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
