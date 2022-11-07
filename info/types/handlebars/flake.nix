{

  inputs.packument.url   = "https://registry.npmjs.org/@types/handlebars?rev=262-349327cdd62d3664e76d953e5ab9b32b";
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
    scope = "@types";
    ident = "@types/handlebars";
    ldir  = "info/types/handlebars";
    inherit packument fetchInfo;
  } // latest';

}
