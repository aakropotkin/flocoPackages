{

  inputs.packument.url   = "https://registry.npmjs.org/selenium-webdriver?rev=319-91456b2d28ba2971070bb60bcce57a71";
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
    ident = "selenium-webdriver";
    ldir  = "info/unscoped/s/selenium-webdriver";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
