{

  inputs.packument.url   = "https://registry.npmjs.org/inline-style-parser?rev=2-17bc0ea03483372f13d12de9e27cd7ce";
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
    ident = "inline-style-parser";
    ldir  = "info/unscoped/i/inline-style-parser";
    inherit packument fetchInfo;
  } // latest';

}
