{

  inputs.packument.url   = "https://registry.npmjs.org/common-tags?rev=68-f4dffd92a5825cb369032b9630c1eb3a";
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
    ident = "common-tags";
    ldir  = "info/unscoped/c/common-tags";
    inherit packument fetchInfo;
  } // latest';

}
