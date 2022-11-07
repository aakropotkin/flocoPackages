{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-discard-empty?rev=47-18d6cad3e502cebd8688791c233abd3e";
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
    ident = "postcss-discard-empty";
    ldir  = "info/unscoped/p/postcss-discard-empty";
    inherit packument fetchInfo;
  } // latest';

}
