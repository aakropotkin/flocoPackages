{

  inputs.packument.url   = "https://registry.npmjs.org/natural-orderby?rev=9-78690e7de28e81296b0e77332fdba4c7";
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
    ident = "natural-orderby";
    ldir  = "info/unscoped/n/natural-orderby";
    inherit packument fetchInfo;
  } // latest';

}
