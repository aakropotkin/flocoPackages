{

  inputs.packument.url   = "https://registry.npmjs.org/@formatjs/intl-localematcher";
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
    scope = "@formatjs";
    ident = "@formatjs/intl-localematcher";
    ldir  = "info/formatjs/intl-localematcher";
    inherit packument fetchInfo;
  } // latest';

}
