{

  inputs.packument.url   = "https://registry.npmjs.org/hyphenate-style-name?rev=11-52463ce1d82fafef8e3d5b4e53fbceea";
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
    ident = "hyphenate-style-name";
    ldir  = "info/unscoped/h/hyphenate-style-name";
    inherit packument fetchInfo;
  } // latest';

}
