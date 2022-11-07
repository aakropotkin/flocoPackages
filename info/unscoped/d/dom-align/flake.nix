{

  inputs.packument.url   = "https://registry.npmjs.org/dom-align?rev=70-ded198a7835272b77806836dcf273875";
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
    ident = "dom-align";
    ldir  = "info/unscoped/d/dom-align";
    inherit packument fetchInfo;
  } // latest';

}
